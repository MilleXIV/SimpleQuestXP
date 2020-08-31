local GetQuestLogRewardXP = GetQuestLogRewardXP
local choosePoint, chooseParent, chooseRelPoint, chooseXOff, chooseYOff = QuestLogItemChooseText:GetPoint()
local SimpleQuestXPText = QuestLogDetailScrollChildFrame:CreateFontString("SimpleQuestXPText", "BACKGROUND", "QuestFont")

SimpleQuestXPText:SetPoint(choosePoint, chooseParent, chooseRelPoint, chooseXOff, chooseYOff)
QuestLogItemChooseText:SetPoint(choosePoint, SimpleQuestXPText, chooseRelPoint, chooseXOff, chooseYOff)

local function selectQuestHook(qIndex)
    SimpleQuestXPText:SetText(EXPERIENCE_COLON.." "..GetQuestLogRewardXP())
end
hooksecurefunc("SelectQuestLogEntry", selectQuestHook)