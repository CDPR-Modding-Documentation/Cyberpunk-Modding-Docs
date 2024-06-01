module My_Nickname.My_Mod_Name

enum ESupportedVehicle {
  Invalid = 0,
  Supron = 1
}

enum EMeshAppearanceCC {
  Standard = 0,
  Coated = 1
}

public class Utils extends ScriptableSystem {

  public static func Get(gi: GameInstance) -> ref<Utils> {
    return GameInstance.GetScriptableSystemsContainer(gi).Get(n"My_Nickname.My_Mod_Name.Utils") as Utils;
  }

  public func IsTargetVehicle(vehicle: ref<VehicleObject>) -> ESupportedVehicle {

    if IsDefined(vehicle) {
      let vehicleRecord: ref<Vehicle_Record>;
      VehicleComponent.GetVehicleRecord(vehicle, vehicleRecord);

      if Equals(vehicleRecord.GetID(), t"Vehicle.v_standard25_mahir_supron_player") {
        return ESupportedVehicle.Supron;
      }
    }

    return ESupportedVehicle.Invalid;
  }

  public func CustomizeMesh(vehicleModel: ESupportedVehicle, ccEnabled: Bool, meshComp: ref<MeshComponent>, components: array<ref<IComponent>>) -> ref<IComponent> {
    
    let meshAppearance: String = ToString(ccEnabled ? EMeshAppearanceCC.Coated : EMeshAppearanceCC.Standard);
    let widget: ref<IComponent>;
    
    // Retrieve the optional CC widget
    for comp in components {
      if Equals(s"\(comp.GetName())", s"visual_customization_\(meshComp.name)") {
        widget = comp;
        break;
      }
    }

    meshAppearance = StrLower(meshAppearance);
    meshComp.meshAppearance = StringToName(meshAppearance);
    
    if Equals(meshAppearance, "coated") {
      return widget;
    }

    return null;
  }
}

public class VehicleWatcher extends ScriptableSystem {

  private let m_callbackSystem: wref<CallbackSystem>;
  public let vehicleModel: ESupportedVehicle;

  public static func Get(gi: GameInstance) -> ref<VehicleWatcher> {
    let ref = GameInstance.GetScriptableSystemsContainer(gi).Get(n"My_Nickname.My_Mod_Name.VehicleWatcher") as VehicleWatcher;
    ref.Initialize();

    return ref;
  }

  private func OnAttach() {
    let template = r"base\\vehicles\\standard\\v_standard25_mahir_supron_01__basic_01.ent";
    let entityAppearance = n"mahir_supron__basic_player_01";

    this.m_callbackSystem = GameInstance.GetCallbackSystem();
    this.m_callbackSystem.RegisterCallback(n"Entity/Assemble", this, n"OnEntityAssemble")
      .AddTarget(EntityTarget.Template(template))
      .AddTarget(EntityTarget.Appearance(entityAppearance));

    this.m_callbackSystem.RegisterCallback(n"Entity/Reassemble", this, n"OnEntityReassemble")
      .AddTarget(EntityTarget.Template(template))
      .AddTarget(EntityTarget.Appearance(entityAppearance));

    this.Initialize();
  }

  private func Initialize() {
    this.vehicleModel = ESupportedVehicle.Supron;
  }
  
  private func ApplyVehicleCustomization(vehicle: ref<VehicleObject>, ccEnabled: Bool, opt isAssembly: Bool) {
    let gi: GameInstance = this.GetGameInstance();
    if !IsDefined(vehicle) {
      return;
    }

    let components = vehicle.GetComponents();

    for comp in components {
      if comp == (comp as MeshComponent) {
        if  StrEndsWith(s"\(comp.GetName())", s"_custom") {
          let widget = Utils.Get(gi).CustomizeMesh(this.vehicleModel, ccEnabled, comp as MeshComponent, components);
          
          if !isAssembly {
            comp.LoadAppearance(); // Must not be used during assembly
          }

          if IsDefined(widget) {
            widget.Toggle(false);
            widget.Toggle(true);
          }
        }
      }
      else if Equals(comp.GetClassName(), n"WorldWidgetComponent") {
        if !StrEndsWith(s"\(comp.GetName())", s"_custom") {
          comp.Toggle(false);
          comp.Toggle(true);
        }
      }
    }
  }
  
  private func ProcessEvent(event: ref<EntityLifecycleEvent>) {
    
    let vehicle = event.GetEntity() as VehicleObject;
    let ccEnabled: Bool = vehicle.GetVehiclePS().GetIsVehicleVisualCustomizationActive();
    
    this.ApplyVehicleCustomization(vehicle, ccEnabled, true);
  }

  private cb func OnEntityAssemble(event: ref<EntityLifecycleEvent>) {
    this.ProcessEvent(event);
  }

  private cb func OnEntityReassemble(event: ref<EntityLifecycleEvent>) {
    this.ProcessEvent(event);
  }
}

@wrapMethod(VehicleComponent)
private final func ExecuteVehicleVisualCustomization(set: Bool, reset: Bool, instant: Bool) -> Void {
  
  let vehicle = this.GetVehicle();
  let gi: GameInstance = vehicle.GetGame();

  if NotEquals(Utils.Get(gi).IsTargetVehicle(vehicle), ESupportedVehicle.Invalid) {
    let watcher = VehicleWatcher.Get(gi);
    watcher.ApplyVehicleCustomization(vehicle, !reset);
  }

  wrappedMethod(set, reset, instant);
}