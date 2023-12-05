#include <amxmodx>
#include <VipModular>
#include <auw>

#pragma semicolon 1
#pragma compress 1

public stock const PluginName[] = "[VipM-I] AUW";
public stock const PluginVersion[] = "1.0.0";
public stock const PluginAuthor[] = "ArKaNeMaN";
public stock const PluginURL[] = "t.me/arkaneman";

new const TYPE_NAME[] = "AUW-Weapon";

public VipM_IC_OnInitTypes() {
    register_plugin(PluginName, PluginVersion, PluginAuthor);

    VipM_IC_RegisterType(TYPE_NAME);
    VipM_IC_RegisterTypeEvent(TYPE_NAME, ItemType_OnGive, "@OnAuwWeaponGive");
}

@OnAuwWeaponGive(const UserId, const Trie:tParams) {
    static sWeaponName[64];
    VipM_Params_GetStr(tParams, "Name", sWeaponName, charsmax(sWeaponName));
    auw_give_weapon(UserId, sWeaponName, .notification = false);
}
