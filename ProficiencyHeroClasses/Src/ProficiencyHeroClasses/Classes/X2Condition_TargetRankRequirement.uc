class X2Condition_TargetRankRequirement extends X2Condition;

var int iMinRank;
var int iMaxTank;
var string LogEffectName;

event name CallAbilityMeetsCondition(XComGameState_BaseObject kTarget, XComGameState_BaseObject kSource)
{
	local XComGameState_Unit TargetUnit;
	local int iTargetRank;
	local bool bLog;

	bLog = true;

	TargetUnit = XComGameState_Unit(kTarget);
	iTargetRank = TargetUnit.GetSoldierRank();

	`log("TargetRankRequirement: Beginning Rank checks for" @ kAbility.GetMyTemplateName() $ ":" @ LogEffectName, bLog, 'PHC');
	`log("TargetRankRequirement: TargetUnit is" @ TargetUnit.GetFullName() @ "and target's Rank is:" @ iTargetRank, bLog, 'PHC');
	`log("TargetRankRequirement: Expected MinRank is" @ iMinRank @ "and expected MaxRank is:" @ iMaxRank, bLog, 'PHC');

	if (iMinRank != INDEX_NONE && iTargetRank < iMinRank)
	{
		return 'AA_UnitRankOutOfRange';
	}

	if (iMaxRank != INDEX_NONE && iTargetRank > iMaxRank)
	{
		return 'AA_UnitRankOutOfRange';
	}

	return 'AA_Success';
}

defaultproperties
{
	iMinRank = -1
	iMaxRank = -1
}