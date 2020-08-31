local GetQuestLogRewardXP = GetQuestLogRewardXP
local SimpleQuestXPText = QuestLogDetailScrollChildFrame:CreateFontString("SimpleQuestXPText", "BACKGROUND", "QuestFont")

local choosePoint, _, chooseRelPoint, chooseXOff, chooseYOff = QuestLogItemChooseText:GetPoint()
SimpleQuestXPText:SetPoint(choosePoint, QuestLogRewardTitleText, chooseRelPoint, chooseXOff, chooseYOff)
SimpleQuestXPText:Hide()

local function selectQuestHook(qIndex)
    local xp = GetQuestLogRewardXP()
    local numRewards = GetNumQuestLogRewards()
	local numChoices = GetNumQuestLogChoices()
    local money = GetQuestLogRewardMoney()
    local numSpells = GetNumQuestLogRewardSpells()

    if not QuestLogRewardTitleText:IsShown() and (xp + numRewards + numChoices + numSpells + money) > 0 then
        QuestLogRewardTitleText:Show()
    end

    if xp > 0 then
        SimpleQuestXPText:SetText(EXPERIENCE_COLON.." "..xp)
        SimpleQuestXPText:Show()
        
        if numChoices > 0 then
            local choosePoint, _, chooseRelPoint, chooseXOff, chooseYOff = QuestLogItemChooseText:GetPoint()
            QuestLogItemChooseText:SetPoint(choosePoint, SimpleQuestXPText, chooseRelPoint, chooseXOff, chooseYOff)
            return qIndex
        end
        if numSpells > 0 then
            local spellPoint, _, spellRelPoint, spellXOff, spellYOff = QuestLogSpellLearnText:GetPoint()
            QuestLogSpellLearnText:SetPoint(spellPoint, SimpleQuestXPText, spellRelPoint, spellXOff, spellYOff)
            return qIndex
        end
        if (numRewards + money) > 0 then
            local recPoint, _, recRelPoint, recXOff, recYOff = QuestLogItemReceiveText:GetPoint()
            QuestLogItemReceiveText:SetPoint(recPoint, SimpleQuestXPText, recRelPoint, recXOff, recYOff)
            return qIndex
        end
    end
end
hooksecurefunc("QuestLog_UpdateQuestDetails", selectQuestHook)