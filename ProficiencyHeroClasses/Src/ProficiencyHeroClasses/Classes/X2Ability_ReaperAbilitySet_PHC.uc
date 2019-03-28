class X2Ability_ReaperAbilitySet_PHC extends X2Ability;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(ShadowTactics());

	return Templates;
}

static function X2AbilityTemplate ShadowTactics()
{
	local X2AbilityTemplate					Template;
	local X2Condition_TargetRankRequirement	RankCondition1, RankCondition2, RankCondition3;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ShadowTactics');
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_shadow"
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	Template.bCrossClassEligible = false;
	
	RankCondition1 = new class 'X2Condition_TargetRankRequirement';
	RankCondition1.iMinRank = -1;
	RankCondition1.iMaxRank = 2;
	RankCondition1.LogEffectName = "Shadow Tactics 1";

	RankCondition2 = new class 'X2Condition_TargetRankRequirement';
	RankCondition2.iMinRank = 3;
	RankCondition2.iMaxRank = 5;
	RankCondition2.LogEffectName = "Shadow Tactics 2";

	RankCondition3 = new class 'X2Condition_TargetRankRequirement';
	RankCondition3.iMinRank = 6;
	RankCondition3.iMaxRank = -1;
	RankCondition3.LogEffectName = "Shadow Tactics 3";

}