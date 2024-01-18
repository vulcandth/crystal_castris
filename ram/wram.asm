SECTION "Stack", WRAM0

wStackBottom::
	ds $100 - 1
wStackTop::
	ds 1


SECTION "Audio RAM", WRAM0

; nonzero if playing
wMusicPlaying:: db

wAudio::
; wChannel1 - wChannel8
for n, 1, NUM_CHANNELS + 1
wChannel{d:n}:: channel_struct wChannel{d:n}
endr

	ds 1

wCurTrackDuty:: db
wCurTrackVolumeEnvelope:: db
wCurTrackFrequency:: dw
wUnusedBCDNumber:: db ; BCD value, dummied out
wCurNoteDuration:: db ; used in MusicE0 and LoadNote

wCurMusicByte:: db
wCurChannel:: db
wVolume::
; corresponds to rNR50
; Channel control / ON-OFF / Volume (R/W)
;   bit 7 - Vin->SO2 ON/OFF
;   bit 6-4 - SO2 output level (volume) (# 0-7)
;   bit 3 - Vin->SO1 ON/OFF
;   bit 2-0 - SO1 output level (volume) (# 0-7)
	db
wSoundOutput::
; corresponds to rNR51
; bit 4-7: ch1-4 so2 on/off
; bit 0-3: ch1-4 so1 on/off
	db
wPitchSweep::
; corresponds to rNR10
; bit 7:   unused
; bit 4-6: sweep time
; bit 3:   sweep direction
; but 0-2: sweep shift
	db

wMusicID:: dw
wMusicBank:: db
wNoiseSampleAddress:: dw
wNoiseSampleDelay:: db
	ds 1
wMusicNoiseSampleSet:: db
wSFXNoiseSampleSet:: db

wLowHealthAlarm::
; bit 7: on/off
; bit 4: pitch
; bit 0-3: counter
	db

wMusicFade::
; fades volume over x frames
; bit 7: fade in/out
; bit 0-5: number of frames for each volume level
; $00 = none (default)
	db
wMusicFadeCount:: db
wMusicFadeID:: dw

	ds 5

wCryPitch:: dw
wCryLength:: dw

wLastVolume:: db
wUnusedMusicF9Flag:: db

wSFXPriority::
; if nonzero, turn off music when playing sfx
	db

	ds 1

wChannel1JumpCondition:: db
wChannel2JumpCondition:: db
wChannel3JumpCondition:: db
wChannel4JumpCondition:: db

wStereoPanningMask:: db

wCryTracks::
; plays only in left or right track depending on what side the monster is on
; both tracks active outside of battle
	db

wSFXDuration:: db
wCurSFX::
; id of sfx currently playing
	db

wAudioEnd::

wMapMusic:: db

wDontPlayMapMusicOnReload:: db


SECTION "WRAM", WRAM0

	ds 4

wBoxAlignment:: db

wInputType::        db
wAutoInputAddress:: dw
wAutoInputBank::    db
wAutoInputLength::  db

wDebugFlags:: db
wGameLogicPaused:: db
wSpriteUpdatesEnabled:: db

wUnusedScriptByte:: db

wMapTimeOfDay:: db

wPalFlags:: db

	ds 2

wPrinterConnectionOpen:: db
wPrinterOpcode:: db

	ds 1

wDisableTextAcceleration:: db
wPrevLandmark:: db
wCurLandmark:: db
wLandmarkSignTimer:: dw

wLinkMode::
; a LINK_* value for the link type
	db

wScriptVar:: db

wPlayerNextMovement:: db
wPlayerMovement:: db

wLinkOtherPlayerGender:: db
	ds 1

wMovementObject::
	db
wMovementDataBank:: db
wMovementDataAddress:: dw
wIndexedMovement2Pointer:: dw

	ds 2

wContinueReadingMovement:: db

UNION
wObjectPriorities:: ds NUM_OBJECT_STRUCTS

NEXTU
wMovementPointer:: dw
	ds 3
wTempObjectCopyMapObjectIndex:: db
wTempObjectCopySprite:: db
wTempObjectCopySpriteVTile:: db
wTempObjectCopyPalette:: db
wTempObjectCopyMovement:: db
wTempObjectCopyRange:: db
wTempObjectCopyX:: db
wTempObjectCopyY:: db
wTempObjectCopyRadius:: db
ENDU

	ds 1

wTileDown::  db
wTileUp::    db
wTileLeft::  db
wTileRight:: db

wTilePermissions::
; set if tile behavior prevents
; you from walking in that direction
; bit 3: down
; bit 2: up
; bit 1: left
; bit 0: right
	db


SECTION "wSpriteAnims", WRAM0

UNION
wSpriteAnimData::

wSpriteAnimDict::
; wSpriteAnimDict pairs keys with values
; keys: SPRITE_ANIM_DICT_* indexes (taken from SpriteAnimObjects)
; values: vTiles0 offsets
	ds NUM_SPRITEANIMDICT_ENTRIES * 2

wSpriteAnimationStructs::
; wSpriteAnim1 - wSpriteAnim10
for n, 1, NUM_SPRITE_ANIM_STRUCTS + 1
; field  0:   index
; fields 1-3: loaded from SpriteAnimObjects
wSpriteAnim{d:n}:: sprite_anim_struct wSpriteAnim{d:n}
endr
wSpriteAnimationStructsEnd::

NEXTU
; mobile data
wMobileWRAM::
wMobileErrorCodeBuffer:: ds 3
wc305:: ds 1
wc306:: ds 1
wc307:: ds 1
wc308:: ds 1
wc309:: ds 1
wc30a:: ds 1
wc30b:: ds 1
wc30c:: ds 1
wc30d:: ds 1
wc30e:: ds 1
wc30f:: ds 1
wc310:: ds 1
wc311:: ds 1
wc312:: ds 1
wc313:: ds 1
wc314:: ds 5
wc319:: db
wc31a:: db
wc31b:: db
wc31c:: db
wc31d:: db
wc31e:: db
wc31f:: db
wc320:: ds 38
wc346:: ds 102
wc3ac:: ds 8
ENDU

wSpriteAnimCount:: db
wCurSpriteOAMAddr:: db

wCurIcon:: db

wCurIconTile:: db
UNION
wSpriteAnimID::
wCurSpriteOAMFlags:: db
NEXTU
wSpriteAnimAddrBackup:: dw
ENDU
wCurAnimVTile:: db
wCurAnimXCoord:: db
wCurAnimYCoord:: db
wCurAnimXOffset:: db
wCurAnimYOffset:: db
wGlobalAnimYOffset:: db
wGlobalAnimXOffset:: db

wSpriteAnimDataEnd::

	ds 11

; mobile data
wc3cc:: ds 1
wEmailAddress:: ds MOBILE_EMAIL_LENGTH
	ds 1
wc3ec:: ds 1
wc3ed:: ds 1
wc3ee:: ds 1
wc3ef:: ds 1
wc3f0:: ds 1
wc3f1:: ds 1
wc3f2:: ds 1
wc3f3:: ds 1
wc3f4:: ds 1
wc3f5:: ds 1
wc3f6:: ds 1
wc3f7:: ds 1
wc3f8:: ds 1
	ds 3
wMobileWRAMEnd::


SECTION "Sprites", WRAM0

wShadowOAM::
; wShadowOAMSprite00 - wShadowOAMSprite39
for n, NUM_SPRITE_OAM_STRUCTS
wShadowOAMSprite{02d:n}:: sprite_oam_struct wShadowOAMSprite{02d:n}
endr
wShadowOAMEnd::


SECTION "Tilemap", WRAM0

wTilemap::
; 20x18 grid of 8x8 tiles
	ds SCREEN_WIDTH * SCREEN_HEIGHT
wTilemapEnd::


; This union spans 480 bytes.
SECTION UNION "Miscellaneous", WRAM0

; box save buffer
; SaveBoxAddress uses this buffer in three steps because it
; needs more space than the buffer can hold.
wBoxPartialData:: ds 480
wBoxPartialDataEnd::


SECTION UNION "Miscellaneous", WRAM0

; battle tower temp struct
wBT_OTTemp:: battle_tower_struct wBT_OTTemp


SECTION UNION "Miscellaneous", WRAM0

; battle data
wBattle::
wEnemyMoveStruct::  move_struct wEnemyMoveStruct
wPlayerMoveStruct:: move_struct wPlayerMoveStruct

wEnemyMonNickname::  ds MON_NAME_LENGTH
wBattleMonNickname:: ds MON_NAME_LENGTH

wBattleMon:: battle_struct wBattleMon

	ds 2

wWildMon:: db
	ds 1

wEnemyTrainerItem1:: db
wEnemyTrainerItem2:: db
wEnemyTrainerBaseReward:: db
wEnemyTrainerAIFlags:: ds 3
wOTClassName:: ds TRAINER_CLASS_NAME_LENGTH

wCurOTMon:: db

wBattleParticipantsNotFainted::
; Bit array.  Bits 0 - 5 correspond to party members 1 - 6.
; Bit set if the mon appears in battle.
; Bit cleared if the mon faints.
; Backed up if the enemy switches.
; All bits cleared if the enemy faints.
	db

wTypeModifier::
; >10: super-effective
;  10: normal
; <10: not very effective
; bit 7: stab
	db

wCriticalHit::
; 0 if not critical
; 1 for a critical hit
; 2 for a OHKO
	db

wAttackMissed::
; nonzero for a miss
	db

wPlayerSubStatus1:: db
wPlayerSubStatus2:: db
wPlayerSubStatus3:: db
wPlayerSubStatus4:: db
wPlayerSubStatus5:: db

wEnemySubStatus1:: db
wEnemySubStatus2:: db
wEnemySubStatus3:: db
wEnemySubStatus4:: db
wEnemySubStatus5:: db

wPlayerRolloutCount:: db
wPlayerConfuseCount:: db
wPlayerToxicCount:: db
wPlayerDisableCount:: db
wPlayerEncoreCount:: db
wPlayerPerishCount:: db
wPlayerFuryCutterCount:: db
wPlayerProtectCount:: db

wEnemyRolloutCount:: db
wEnemyConfuseCount:: db
wEnemyToxicCount:: db
wEnemyDisableCount:: db
wEnemyEncoreCount:: db
wEnemyPerishCount:: db
wEnemyFuryCutterCount:: db
wEnemyProtectCount:: db

wPlayerDamageTaken:: dw
wEnemyDamageTaken::  dw

wBattleReward:: ds 3

wBattleAnimParam:: db

wBattleScriptBuffer:: ds 40

wBattleScriptBufferAddress:: dw

wTurnEnded:: db

wIsConfusionDamage:: db

wPlayerStats::
wPlayerAttack::  dw
wPlayerDefense:: dw
wPlayerSpeed::   dw
wPlayerSpAtk::   dw
wPlayerSpDef::   dw
	ds 1

wEnemyStats::
wEnemyAttack::  dw
wEnemyDefense:: dw
wEnemySpeed::   dw
wEnemySpAtk::   dw
wEnemySpDef::   dw
	ds 1

wPlayerStatLevels::
wPlayerAtkLevel::  db
wPlayerDefLevel::  db
wPlayerSpdLevel::  db
wPlayerSAtkLevel:: db
wPlayerSDefLevel:: db
wPlayerAccLevel::  db
wPlayerEvaLevel::  db
	ds 1

wEnemyStatLevels::
wEnemyAtkLevel::  db
wEnemyDefLevel::  db
wEnemySpdLevel::  db
wEnemySAtkLevel:: db
wEnemySDefLevel:: db
wEnemyAccLevel::  db
wEnemyEvaLevel::  db
	ds 1

wEnemyTurnsTaken::  db
wPlayerTurnsTaken:: db
	ds 1

wPlayerSubstituteHP:: db
wEnemySubstituteHP::  db

wUnusedPlayerLockedMove:: db
	ds 1

wCurPlayerMove:: db
wCurEnemyMove::  db

wLinkBattleRNCount::
; how far through the prng stream
	db

wEnemyItemState:: db
	ds 2
wCurEnemyMoveNum:: db

wEnemyHPAtTimeOfPlayerSwitch:: dw
wPayDayMoney:: ds 3

	ds 1
wEnemyBackupDVs:: dw ; used when enemy is transformed
wAlreadyDisobeyed:: db

wDisabledMove:: db
wEnemyDisabledMove:: db
wWhichMonFaintedFirst:: db

; exists so you can't counter on switch
wLastPlayerCounterMove:: db
wLastEnemyCounterMove:: db

wEnemyMinimized:: db

wAlreadyFailed:: db

wBattleParticipantsIncludingFainted:: db
wBattleLowHealthAlarm:: db
wPlayerMinimized:: db
wPlayerScreens::
; bit
; 0 spikes
; 1
; 2 safeguard
; 3 light screen
; 4 reflect
; 5-7 unused
	db

wEnemyScreens::
; see wPlayerScreens
	db

wPlayerSafeguardCount:: db
wPlayerLightScreenCount:: db
wPlayerReflectCount:: db
	ds 1

wEnemySafeguardCount:: db
wEnemyLightScreenCount:: db
wEnemyReflectCount:: db
	ds 1

	ds 1

wBattleWeather::
; 00 normal
; 01 rain
; 02 sun
; 03 sandstorm
; 04 rain stopped
; 05 sunliight faded
; 06 sandstorm subsided
	db

wWeatherCount::
; # turns remaining
	db

wLoweredStat:: db
wEffectFailed:: db
wFailedMessage:: db
wEnemyGoesFirst:: db

wPlayerIsSwitching:: db
wEnemyIsSwitching::  db

wPlayerUsedMoves::
; add a move that has been used once by the player
; added in order of use
	ds NUM_MOVES

wEnemyAISwitchScore:: db
wEnemySwitchMonParam:: db
wEnemySwitchMonIndex:: db
wTempLevel:: db
wLastPlayerMon:: db
wLastPlayerMove:: db
wLastEnemyMove:: db

wPlayerFutureSightCount:: db
wEnemyFutureSightCount:: db

wGivingExperienceToExpShareHolders:: db

wBackupEnemyMonBaseStats:: ds NUM_EXP_STATS
wBackupEnemyMonCatchRate:: db
wBackupEnemyMonBaseExp:: db

wPlayerFutureSightDamage:: dw
wEnemyFutureSightDamage:: dw
wPlayerRageCounter:: db
wEnemyRageCounter:: db

wBeatUpHitAtLeastOnce:: db

wPlayerTrappingMove:: db
wEnemyTrappingMove:: db
wPlayerWrapCount:: db
wEnemyWrapCount:: db
wPlayerCharging:: db
wEnemyCharging:: db

wBattleEnded:: db

wWildMonMoves:: ds NUM_MOVES
wWildMonPP:: ds NUM_MOVES

wAmuletCoin:: db

wSomeoneIsRampaging:: db

wPlayerJustGotFrozen:: db
wEnemyJustGotFrozen:: db
wBattleEnd::


SECTION UNION "Miscellaneous", WRAM0

; link patch lists
wPlayerPatchLists:: ds SERIAL_PATCH_LIST_LENGTH
wOTPatchLists:: ds SERIAL_PATCH_LIST_LENGTH


SECTION UNION "Miscellaneous", WRAM0

; mobile
wMobileTransferData:: ds 480


SECTION UNION "Miscellaneous", WRAM0

; This union spans 200 bytes.
UNION
; timeset temp storage
wTimeSetBuffer::
	ds 20
wInitHourBuffer:: db
	ds 9
wInitMinuteBuffer:: db
	ds 19
wTimeSetBufferEnd::

NEXTU
; hall of fame temp struct
wHallOfFameTemp:: hall_of_fame wHallOfFameTemp

NEXTU
; odd egg
wOddEgg:: party_struct wOddEgg
wOddEggName:: ds MON_NAME_LENGTH
wOddEggOT:: ds NAME_LENGTH

NEXTU
; debug tileset color picker
wDebugLightTileColor:: ds 2
wDebugDarkTileColor::  ds 2
wDebugBlackTileColor:: ds 2

NEXTU
wMobileMon::       party_struct wMobileMon
wMobileMonOT::     ds NAME_LENGTH_JAPANESE - 1
wMobileMonNick::   ds NAME_LENGTH_JAPANESE - 1
wMobileMonMail::   mailmsg_jp wMobileMonMail

NEXTU
wc608:: ds 7
wc688:: ds 2
wc68a:: ds 15
ENDU

; This union spans 280 bytes.
UNION
; pokedex
wPokedexDataStart::
wDexListingScrollOffset:: dw ; offset of the first displayed entry from the start
wDexListingCursor:: db ; Dex cursor
wDexListingEnd:: dw ; Last mon to display
wDexListingHeight:: db ; number of entries displayed at once in the dex listing
wCurDexMode:: db ; Pokedex Mode
wDexSearchMonType1:: db ; first type to search
wDexSearchMonType2:: db ; second type to search
wDexSearchResultCount:: dw
wDexArrowCursorPosIndex:: db
wDexArrowCursorDelayCounter:: db
wDexArrowCursorBlinkCounter:: db
wDexSearchSlowpokeFrame:: db
wUnlockedUnownMode:: db
wDexCurUnownIndex:: db
wDexUnownCount:: db
wDexConvertedMonType:: db ; mon type converted from dex search mon type
wDexListingScrollOffsetBackup:: dw
wDexListingCursorBackup:: db
wBackupDexListingCursor:: db
wBackupDexListingPage:: dw
wDexCurLocation:: db
wPokedexStatus:: db
wPokedexDisplayNumber:: dw
wDexLastSeenIndex:: db ; index into wPokedexSeen containing the last non-zero value
wDexLastSeenValue:: db ; value at index
wDexTempCounter:: dw
wPokedexDataEnd::

wPrevDexEntry:: dw
wPrevDexEntryBackup:: dw
wPrevDexEntryJumptableIndex:: db

wPokedexNameBuffer:: ds MON_NAME_LENGTH
	ds 231

NEXTU
; pokegear
wPokegearPhoneDisplayPosition:: db
wPokegearPhoneCursorPosition:: db
wPokegearPhoneScrollPosition:: db
wPokegearPhoneSelectedPerson:: db
wPokegearPhoneSubmenuCursor:: db
wPokegearMapCursorObjectPointer:: dw
wPokegearMapCursorLandmark:: db
wPokegearMapPlayerIconLandmark:: db
wPokegearRadioChannelBank:: db
wPokegearRadioChannelAddr:: dw
wPokegearRadioMusicPlaying:: db

NEXTU
; trade
wPlayerTrademon:: trademon wPlayerTrademon
wOTTrademon::     trademon wOTTrademon
wTradeAnimAddress:: dw
wLinkPlayer1Name:: ds NAME_LENGTH
wLinkPlayer2Name:: ds NAME_LENGTH
wLinkTradeSendmonSpecies:: db
wLinkTradeGetmonSpecies::  db

NEXTU
; naming screen
wNamingScreenDestinationPointer:: dw
wNamingScreenCurNameLength:: db
wNamingScreenMaxNameLength:: db
wNamingScreenType:: db
wNamingScreenCursorObjectPointer:: dw
wNamingScreenLastCharacter:: db
wNamingScreenStringEntryCoord:: dw

NEXTU
; slot machine
wSlots::
wReel1:: slot_reel wReel1
wReel2:: slot_reel wReel2
wReel3:: slot_reel wReel3
wReel1Stopped:: ds 3
wReel2Stopped:: ds 3
wReel3Stopped:: ds 3
wSlotBias:: db
wSlotBet:: db
wFirstTwoReelsMatching:: db
wFirstTwoReelsMatchingSevens:: db
wSlotMatched:: db
wCurReelStopped:: ds 3
wPayout:: dw
wCurReelXCoord:: db
wCurReelYCoord:: db
	ds 2
wSlotBuildingMatch:: db
wSlotsDataEnd::
	ds 28
wSlotsEnd::

NEXTU
; card flip
wDeck:: ds 4 * 6
wDeckEnd::
wCardFlipNumCardsPlayed:: db
wCardFlipFaceUpCard:: db
wDiscardPile:: ds 4 * 6
wDiscardPileEnd::

; beta poker game
wBetaPokerSGBPals:: dw
	ds 1
wBetaPokerSGBAttr:: db
wBetaPokerSGBCol:: db
wBetaPokerSGBRow:: db

NEXTU
; unused memory game
wMemoryGameCards:: ds 9 * 5
wMemoryGameCardsEnd::
wMemoryGameLastCardPicked:: db
wMemoryGameCard1:: db
wMemoryGameCard2:: db
wMemoryGameCard1Location:: db
wMemoryGameCard2Location:: db
wMemoryGameNumberTriesRemaining:: db
wMemoryGameLastMatches:: ds 5
wMemoryGameCounter:: db
wMemoryGameNumCardsMatched:: db

NEXTU
; unown puzzle
wPuzzlePieces:: ds 6 * 6

NEXTU
; mobile data
wc6d0:: ds 56
wc708:: db
wc709:: db
wc70a:: db
wc70b:: db
wc70c:: db
wc70d:: db
wc70e:: db
wc70f:: db
wc710:: db
wc711:: db
wc712:: ds 7
wc719:: ds 53
wc7d0:: ds 1
wc7d1:: ds 1
wc7d2:: ds 1
wc7d3:: ds 2
ENDU


SECTION UNION "Overworld Map", WRAM0

; overworld map blocks
wOverworldMapBlocks:: ds 1300
wOverworldMapBlocksEnd::


SECTION UNION "Overworld Map", WRAM0

; GB Printer data
wGameboyPrinterRAM::
wGameboyPrinter2bppSource:: ds 40 tiles
wGameboyPrinter2bppSourceEnd::
wUnusedGameboyPrinterSafeCancelFlag:: db
wPrinterRowIndex:: db

; Printer data
wPrinterData:: ds 4
wPrinterChecksum:: dw
wPrinterHandshake:: db
wPrinterStatusFlags::
; bit 7: set if error 1 (battery low)
; bit 6: set if error 4 (too hot or cold)
; bit 5: set if error 3 (paper jammed or empty)
; if this and the previous byte are both $ff: error 2 (connection error)
	db

wHandshakeFrameDelay:: db
wPrinterSerialFrameDelay:: db
wPrinterSendByteOffset:: dw
wPrinterSendByteCounter:: dw

; tilemap backup?
wPrinterTilemapBuffer:: ds SCREEN_HEIGHT * SCREEN_WIDTH
wPrinterStatus:: db
	ds 1
; High nibble is for margin before the image, low nibble is for after.
wPrinterMargins:: db
wPrinterExposureTime:: db
	ds 16
wGameboyPrinterRAMEnd::


SECTION UNION "Overworld Map", WRAM0

; bill's pc data

	; LCD hblank code block. Labels are defined as part of the code.
	ds $de
	assert BillsPC_LCDCode.End - BillsPC_LCDCode == @ - STARTOF("Overworld Map")

; If you change ordering of this, remember to fix LCD hblank code too.
; Note that (as of when comment was written), hblank can't always keep up
; if doing 4 pals in one go during party shifting.
wBillsPC_CurPals::
wBillsPC_CurPartyPals:: ds 2 * 2 * 2 ; 2 bytes per color, 2 colors, 2 mons
wBillsPC_CurMonPals:: ds 2 * 2 * 4 ; 2 bytes per color, 2 colors, 4 mons

; Stores palettes used for party+box.
wBillsPC_PalList::
wBillsPC_PokepicPal:: ds 2 * 2 * 1

	ds 2 * 2 * 1 ; unused BG3 for shiny+pokerus icons

wBillsPC_MonPals1:: ds 2 * 2 * 4

	ds 2 * 2 * 2 ; unused row2 BG2-3

wBillsPC_MonPals2:: ds 2 * 2 * 4
wBillsPC_PartyPals3:: ds 2 * 2 * 2
wBillsPC_MonPals3:: ds 2 * 2 * 4
wBillsPC_PartyPals4:: ds 2 * 2 * 2
wBillsPC_MonPals4:: ds 2 * 2 * 4
wBillsPC_PartyPals5:: ds 2 * 2 * 2
wBillsPC_MonPals5:: ds 2 * 2 * 4

; Species lists
wBillsPC_PartyList:: ds 6
wBillsPC_BoxList:: ds 20

wBillsPC_HeldIcon:: db
wBillsPC_QuickIcon:: db

; Cursor data
wBillsPC_CursorItem:: db ; what item is selected.
wBillsPC_CursorPos:: db ; 0-3 * 4*row, row 0 is title. Bit 7 means in party.
wBillsPC_CursorHeldBox:: db ; 0 for party, 1-16 otherwise
wBillsPC_CursorHeldSlot:: db ; 0 for nothing held, or 1-20 (1-6 if party)
wBillsPC_CursorDestBox:: db ; 0 for party, 1-16 otherwise
wBillsPC_CursorDestSlot:: db ; 0 for release, or 1-20 (1-6 if party)
wBillsPC_CursorMode:: db ; 0 for regular mode (red), 1 for swap mode (blue), 2 for item mode (green)
wBillsPC_CursorAnimFlag:: db ; manage cursor behaviour

; Quick-move sprite data
wBillsPC_QuickFrom::
wBillsPC_QuickFromBox:: db
wBillsPC_QuickFromSlot:: db
wBillsPC_QuickFromX:: db
wBillsPC_QuickFromY:: db

wBillsPC_QuickTo::
wBillsPC_QuickToBox:: db
wBillsPC_QuickToSlot:: db
wBillsPC_QuickToX:: db
wBillsPC_QuickToY:: db
wBillsPC_QuickFrames:: db

wBillsPC_ApplyThemePals:: db ; used by _CGB_BillsPC

	ds 2

wBillsPC_Blank2bppTiles::
; Since we need GDMA for fast blank copy, reserve blank tiles here.
	ds 4 tiles
wBillsPC_ItemVWF:: ds 10 tiles


SECTION UNION "Overworld Map", WRAM0

; Hall of Fame data
wHallOfFamePokemonList:: hall_of_fame wHallOfFamePokemonList


SECTION UNION "Overworld Map", WRAM0

; raw link data
wLinkData:: ds 1300
wLinkDataEnd::


SECTION UNION "Overworld Map", WRAM0

; link data members
wLinkPlayerName:: ds NAME_LENGTH
wLinkPartyCount:: db
wLinkPartySpecies:: ds PARTY_LENGTH
wLinkPartyEnd:: db ; older code doesn't check PartyCount

UNION
; link player data
wLinkPlayerData::
; wLinkPlayerPartyMon1 - wLinkPlayerPartyMon6
for n, 1, PARTY_LENGTH + 1
wLinkPlayerPartyMon{d:n}:: party_struct wLinkPlayerPartyMon{d:n}
endr

wLinkPlayerPartyMonOTs::
; wLinkPlayerPartyMon1OT - wLinkPlayerPartyMon6OT
for n, 1, PARTY_LENGTH + 1
wLinkPlayerPartyMon{d:n}OT:: ds NAME_LENGTH
endr

wLinkPlayerPartyMonNicknames::
; wLinkPlayerPartyMon1Nickname - wLinkPlayerPartyMon6Nickname
for n, 1, PARTY_LENGTH + 1
wLinkPlayerPartyMon{d:n}Nickname:: ds MON_NAME_LENGTH
endr

NEXTU
; time capsule party data
wTimeCapsulePlayerData::
; wTimeCapsulePartyMon1 - wTimeCapsulePartyMon6
for n, 1, PARTY_LENGTH + 1
wTimeCapsulePartyMon{d:n}:: red_party_struct wTimeCapsulePartyMon{d:n}
endr

wTimeCapsulePartyMonOTs::
; wTimeCapsulePartyMon1OT - wTimeCapsulePartyMon6OT
for n, 1, PARTY_LENGTH + 1
wTimeCapsulePartyMon{d:n}OT:: ds NAME_LENGTH
endr

wTimeCapsulePartyMonNicknames::
; wTimeCapsulePartyMon1Nickname - wTimeCapsulePartyMon6Nickname
for n, 1, PARTY_LENGTH + 1
wTimeCapsulePartyMon{d:n}Nickname:: ds MON_NAME_LENGTH
endr

ENDU


SECTION UNION "Overworld Map", WRAM0

; link data prep
	ds 1000
wCurLinkOTPartyMonTypePointer:: dw

wLinkOTPartyMonTypes::
; wLinkOTPartyMon1Type - wLinkOTPartyMon6Type
for n, 1, PARTY_LENGTH + 1
wLinkOTPartyMon{d:n}Type:: dw
endr


SECTION UNION "Overworld Map", WRAM0

; link mail data
	ds 500
wLinkPlayerMail::
wLinkPlayerMailPreamble:: ds SERIAL_MAIL_PREAMBLE_LENGTH
wLinkPlayerMailMessages:: ds (MAIL_MSG_LENGTH + 1) * PARTY_LENGTH
wLinkPlayerMailMetadata:: ds (MAIL_STRUCT_LENGTH - (MAIL_MSG_LENGTH + 1)) * PARTY_LENGTH
wLinkPlayerMailPatchSet:: ds 100 + SERIAL_PATCH_PREAMBLE_LENGTH
wLinkPlayerMailEnd::
	ds 10
wLinkOTMail::
wLinkOTMailMessages:: ds (MAIL_MSG_LENGTH + 1) * PARTY_LENGTH
wLinkOTMailMetadata:: ds (MAIL_STRUCT_LENGTH - (MAIL_MSG_LENGTH + 1)) * PARTY_LENGTH
wLinkOTMailPatchSet:: ds 100 + SERIAL_PATCH_PREAMBLE_LENGTH
wLinkOTMailPadding:: ds SERIAL_MAIL_PREAMBLE_LENGTH
wLinkOTMailEnd::
	ds 10


SECTION UNION "Overworld Map", WRAM0

; received link mail data
	ds 500
wLinkReceivedMail:: ds MAIL_STRUCT_LENGTH * PARTY_LENGTH
wLinkReceivedMailEnd:: db


SECTION UNION "Overworld Map", WRAM0

; mystery gift data
wMysteryGiftStaging:: ds 80

UNION
wMysteryGiftTrainer:: ds 1 + (1 + 1 + NUM_MOVES) * PARTY_LENGTH + 1
wMysteryGiftTrainerEnd::

NEXTU
wNameCardData:: ds NAME_LENGTH + 2 + 2 + 1 + 8 + 12
wNameCardDataEnd::

NEXTU
wMysteryGiftCardHolderName:: ds PLAYER_NAME_LENGTH
ENDU

	ds 138

wMysteryGiftPartnerData::
wMysteryGiftPartnerGameVersion:: db
wMysteryGiftPartnerID:: dw
wMysteryGiftPartnerName:: ds NAME_LENGTH
wMysteryGiftPartnerDexCaught:: db
wMysteryGiftPartnerSentDeco:: db
wMysteryGiftPartnerWhichItem:: db
wMysteryGiftPartnerWhichDeco:: db
wMysteryGiftPartnerBackupItem:: db
	ds 1
wMysteryGiftPartnerDataEnd::

	ds 60

wMysteryGiftPlayerData::
wMysteryGiftPlayerGameVersion:: db
wMysteryGiftPlayerID:: dw
wMysteryGiftPlayerName:: ds NAME_LENGTH
wMysteryGiftPlayerDexCaught:: db
wMysteryGiftPlayerSentDeco:: db
wMysteryGiftPlayerWhichItem:: db
wMysteryGiftPlayerWhichDeco:: db
wMysteryGiftPlayerBackupItem:: db
	ds 1
wMysteryGiftPlayerDataEnd::


SECTION UNION "Overworld Map", WRAM0

	ds $200

; mystery gift data
wUnusedMysteryGiftStagedDataLength:: db
wMysteryGiftMessageCount:: db
wMysteryGiftStagedDataLength:: db


SECTION UNION "Overworld Map", WRAM0

	ds $200

; blank credits tile buffer
wCreditsBlankFrame2bpp:: ds 4 * 4 tiles
wCreditsBlankFrame2bppEnd::


SECTION UNION "Overworld Map", WRAM0

; mobile
wc807:: db
wc821:: db
wc822:: db
wc981:: db
wc982:: db
wc983:: dw
wc986:: db
wc987:: db
wMobileAPIIndex:: db
wcc60:: ds 1
wcc61:: ds 1
wcc62:: ds 2
wccb4:: ds 1
wccb5:: ds 3


if DEF(_DEBUG)
SECTION UNION "Overworld Map", WRAM0

; debug room RTC values
wDebugRoomRTCSec::  db
wDebugRoomRTCMin::  db
wDebugRoomRTCHour:: db
wDebugRoomRTCDay::  dw
wDebugRoomRTCCurSec::  db
wDebugRoomRTCCurMin::  db
wDebugRoomRTCCurHour:: db
wDebugRoomRTCCurDay::  dw

; debug room paged values
wDebugRoomCurPage::        db
wDebugRoomCurValue::       db
wDebugRoomAFunction::      dw
wDebugRoomStartFunction::  dw
wDebugRoomSelectFunction:: dw
wDebugRoomAutoFunction::   dw
wDebugRoomPageCount::      db
wDebugRoomPagesPointer::   dw

wDebugRoomROMChecksum:: dw
wDebugRoomCurChecksumBank:: db

UNION
; debug room new item values
wDebugRoomItemID::       db
wDebugRoomItemQuantity:: db
NEXTU
; debug room new pokemon values
wDebugRoomMon::    box_struct wDebugRoomMon
wDebugRoomMonBox:: db
NEXTU
; debug room GB ID values
wDebugRoomGBID:: dw
ENDU

endc


SECTION "Video", WRAM0

UNION
; bg map
wBGMapBuffer::    ds 40
wBGMapPalBuffer:: ds 40
wBGMapBufferPointers:: ds 20 * 2
wBGMapBufferEnd::

NEXTU
; credits
wCreditsPos:: dw
wCreditsTimer:: db

NEXTU
; mobile data
wMobileMonSpeciesPointer:: dw
wMobileMonStructPointer:: dw
wMobileMonOTPointer:: dw
wMobileMonNicknamePointer:: dw
wMobileMonMailPointer:: dw

NEXTU
; more mobile data
wcd21:: ds 1
wcd23:: ds 1
wcd24:: ds 1
wMobileCommsJumptableIndex:: ds 1
wcd26:: ds 1
wcd27:: ds 1
wcd28:: ds 1
wcd29:: ds 1

wMobileMonIndex::
wMobileMonMiscSpecies::
wcd2a:: db

UNION
wTempOddEggNickname:: ds MON_NAME_LENGTH
NEXTU
wcd2b:: ds 1
wcd2c:: ds 1
wcd2d:: ds 1
wcd2e:: ds 1
wcd2f:: ds 1
wcd30:: ds 1
wcd31:: ds 1
wcd32:: ds 1
wcd33:: ds 1
wcd34:: ds 1
ENDU

; current time for link/mobile?
wcd36:: db ; hours
wcd37:: db ; mins
wcd38:: db ; secs

wcd39:: ds 1
wBattleTowerRoomMenu2JumptableIndex:: ds 1
wcd42:: ds 1
wcd43:: ds 1

; some sort of timer in link battles
wMobileInactivityTimerMinutes:: db ; mins
wMobileInactivityTimerSeconds:: db ; secs
wMobileInactivityTimerFrames:: db ; frames
wcd47:: ds 1

	ds 1

wBTTempOTSprite::
wcd49:: db

wcd4a:: ds 1
wcd4b:: ds 1

wcd4c:: db
wcd4d:: db

wcd4e:: ds 1
wcd4f:: ds 1
wcd50:: ds 1
wcd51:: ds 1
wcd52:: ds 1

wcd53:: ds 1
wcd54:: ds 1
wcd55:: ds 1
wcd56:: ds 1
wcd57:: ds 1
wcd58:: ds 1
wcd65:: ds 1
wcd66:: ds 1
wcd67:: ds 1
wcd68:: ds 1
wcd69:: ds 1
wcd6a:: ds 1
wcd6b:: ds 1
wcd6d:: ds 1
wcd6e:: ds 1
wcd6f:: ds 1
wcd70:: ds 1
wcd71:: ds 1
wcd72:: ds 1
wcd73:: ds 1
wcd74:: ds 1

wcd77:: ds 1

wMobileCrashCheckPointer:: dw
wcd7c:: ds 3
wcd7f:: ds 1
wcd80:: ds 1
wcd81:: ds 1
wcd82:: ds 1
wcd85:: ds 4
wcd89:: ds 1
wcd8a:: ds 1
wcd8b:: ds 1
wcd8c:: ds 1
wcd8d:: ds 11
ENDU

wDefaultSGBLayout:: db

wPlayerHPPal:: db
wEnemyHPPal:: db

wHPPals:: ds PARTY_LENGTH
wCurHPPal:: db

	ds 7

wSGBPals:: ds 48

wAttrmap::
; 20x18 grid of bg tile attributes for 8x8 tiles
; read horizontally from the top row
;		bit 7: priority
;		bit 6: y flip
;		bit 5: x flip
;		bit 4: pal # (non-cgb)
;		bit 3: vram bank (cgb only)
;		bit 2-0: pal # (cgb only)
	ds SCREEN_WIDTH * SCREEN_HEIGHT
wAttrmapEnd::

UNION
wTileAnimBuffer:: ds 1 tiles
ENDU

; link data
UNION
wOtherPlayerLinkMode:: db
wOtherPlayerLinkAction:: db
	ds 3
wPlayerLinkAction:: db
wUnusedLinkAction:: db
	ds 3
NEXTU
wLinkReceivedSyncBuffer:: ds 5
wLinkPlayerSyncBuffer:: ds 5
ENDU
wLinkTimeoutFrames:: dw
wLinkByteTimeout:: dw

wMonType:: db

wCurSpecies:: db

wNamedObjectType:: db

wItemFlags:: db

wJumptableIndex::
wBattleTowerBattleEnded::
	db

UNION
; intro data
wIntroSceneFrameCounter:: db
wIntroSceneTimer:: db

NEXTU
; title data
wTitleScreenSelectedOption:: db
wTitleScreenTimer:: dw

NEXTU
; credits data
wCreditsBorderFrame:: db
wCreditsBorderMon:: db
wCreditsLYOverride:: db

NEXTU
; pokegear
wPokegearCard:: db
wPokegearMapRegion:: db
wUnusedPokegearByte:: db

NEXTU
; pack
wPackJumptableIndex:: db
wCurPocket:: db
wPackUsedItem:: db

NEXTU
; trainer card badges
wTrainerCardBadgeFrameCounter:: db
wTrainerCardBadgeTileID:: db
wTrainerCardBadgeAttributes:: db

NEXTU
; slot machine
wSlotsDelay:: db
	ds 1
wUnusedSlotReelIconDelay:: db

NEXTU
; card flip
wCardFlipCursorY:: db
wCardFlipCursorX:: db
wCardFlipWhichCard:: db

NEXTU
; unused memory game
wMemoryGameCardChoice:: db

NEXTU
; magnet train
wMagnetTrainOffset:: db
wMagnetTrainPosition:: db
wMagnetTrainWaitCounter:: db

NEXTU
; unown puzzle data
wHoldingUnownPuzzlePiece:: db
wUnownPuzzleCursorPosition:: db
wUnownPuzzleHeldPiece:: db

NEXTU
; battle transitions
wBattleTransitionCounter:: db
wBattleTransitionSineWaveOffset::
wBattleTransitionSpinQuadrant:: db

NEXTU
; debug tileset color picker
wDebugTilesetCurPalette:: db
wDebugTilesetRGBJumptableIndex:: db
wDebugTilesetCurColor:: db

NEXTU
; stats screen
wStatsScreenFlags:: db

NEXTU
; battle tower
wNrOfBeatenBattleTowerTrainers:: db
	ds 1
wBattleTowerRoomMenuJumptableIndex:: db

NEXTU
; miscellaneous
wFrameCounter::
wMomBankDigitCursorPosition::
wNamingScreenLetterCase::
wHallOfFameMonCounter::
wTradeDialog::
	db
wFrameCounter2::
wPrinterQueueLength::
wUnusedSGB1eColorOffset::
	db
wUnusedTradeAnimPlayEvolutionMusic:: db

NEXTU
; mobile
wcf64:: db
wcf65:: db
wcf66:: db
ENDU

wRequested2bppSize:: db
wRequested2bppSource:: dw
wRequested2bppDest:: dw

wRequested1bppSize:: db
wRequested1bppSource:: dw
wRequested1bppDest:: dw

wMenuMetadata::
wWindowStackPointer:: dw
wMenuJoypad:: db
wMenuSelection:: db
wMenuSelectionQuantity:: db
wWhichIndexSet:: db
wScrollingMenuCursorPosition:: db
wWindowStackSize:: db
	ds 8
wMenuMetadataEnd::

; menu header
wMenuHeader::
wMenuFlags:: db
wMenuBorderTopCoord:: db
wMenuBorderLeftCoord:: db
wMenuBorderBottomCoord:: db
wMenuBorderRightCoord:: db
wMenuDataPointer:: dw
wMenuCursorPosition:: db
	ds 1
wMenuDataBank:: db
	ds 6
wMenuHeaderEnd::

wMenuData::
wMenuDataFlags:: db

UNION
; Vertical Menu/DoNthMenu/SetUpMenu
wMenuDataItems:: db
wMenuDataIndicesPointer:: dw
wMenuDataDisplayFunctionPointer:: dw
wMenuDataPointerTableAddr:: dw

NEXTU
; 2D Menu
wMenuData_2DMenuDimensions:: db
wMenuData_2DMenuSpacing:: db
wMenuData_2DMenuItemStringsBank:: db
wMenuData_2DMenuItemStringsAddr:: dw
wMenuData_2DMenuFunctionBank:: db
wMenuData_2DMenuFunctionAddr:: dw

NEXTU
; Scrolling Menu
wMenuData_ScrollingMenuHeight:: db
wMenuData_ScrollingMenuWidth:: db
wMenuData_ScrollingMenuItemFormat:: db
wMenuData_ItemsPointerBank:: db
wMenuData_ItemsPointerAddr:: dw
wMenuData_ScrollingMenuFunction1:: ds 3
wMenuData_ScrollingMenuFunction2:: ds 3
wMenuData_ScrollingMenuFunction3:: ds 3
ENDU
wMenuDataEnd::

wMoreMenuData::
w2DMenuData::
w2DMenuCursorInitY:: db
w2DMenuCursorInitX:: db
w2DMenuNumRows:: db
w2DMenuNumCols:: db
w2DMenuFlags1::
; bit 7: Disable checking of wMenuJoypadFilter
; bit 6: Enable sprite animations
; bit 5: Wrap around vertically
; bit 4: Wrap around horizontally
; bit 3: Set bit 7 in w2DMenuFlags2 and exit the loop if bit 5 is disabled and we tried to go too far down
; bit 2: Set bit 7 in w2DMenuFlags2 and exit the loop if bit 5 is disabled and we tried to go too far up
; bit 1: Set bit 7 in w2DMenuFlags2 and exit the loop if bit 4 is disabled and we tried to go too far left
; bit 0: Set bit 7 in w2DMenuFlags2 and exit the loop if bit 4 is disabled and we tried to go too far right
	db
w2DMenuFlags2:: db
w2DMenuCursorOffsets:: db
wMenuJoypadFilter:: db
w2DMenuDataEnd::

wMenuCursorY:: db
wMenuCursorX:: db
wCursorOffCharacter:: db
wCursorCurrentTile:: dw
	ds 3
wMoreMenuDataEnd::

wOverworldDelay:: db
wTextDelayFrames:: db
wVBlankOccurred:: db

wPredefID:: db
wPredefHL:: dw
wPredefAddress:: dw
wFarCallBC:: dw

wUnusedLinkCommunicationByte:: db

wGameTimerPaused::
; bit 0: game timer paused
; bit 7: something mobile
	db

wPalFadeMode::
; bit 0-1: which (0: everything, 1: BG, 2: OBJ)
; bit 2: perform a smooth dark flash
; bit 3: partial fade (fade b of c frames)
; bit 4: skip the last palette
	db

wJoypadDisable::
; bits 4, 6, or 7 can be used to disable joypad input
; bit 4
; bit 6: ongoing mon faint animation
; bit 7: ongoing sgb data transfer
	db

	ds 1

wInBattleTowerBattle::
; 0 not in BattleTower-Battle
; 1 BattleTower-Battle
	db

	ds 1

wFXAnimID:: dw

wPlaceBallsX:: db
wPlaceBallsY:: db

wTileAnimationTimer:: db

; palette backups?
wBGP:: db
wOBP0:: db
wOBP1:: db

wNumHits:: db

	ds 1

wOptions::
; bit 0-2: number of frames to delay when printing text
;   fast 1; mid 3; slow 5
; bit 3: ?
; bit 4: no text delay
; bit 5: stereo off/on
; bit 6: battle style shift/set
; bit 7: battle scene off/on
	db
wSaveFileExists:: db
wTextboxFrame::
; bits 0-2: textbox frame 0-7
	db
wTextboxFlags::
; bit 0: 1-frame text delay
; bit 4: no text delay
	db
wGBPrinterBrightness::
; bit 0-6: brightness
;   lightest: $00
;   lighter:  $20
;   normal:   $40 (default)
;   darker:   $60
;   darkest:  $7F
	db
wOptions2::
; bit 1: menu account off/on
	db
	ds 2
wOptionsEnd::

; Time buffer, for counting the amount of time since
; an event began.
wSecondsSince:: db
wMinutesSince:: db
wHoursSince:: db
wDaysSince:: db

	ds 7

wTempLoopCounter:: db


SECTION "16-bit WRAM home data", WRAM0
; align to $20

wConversionTableBitmap:: ds $20


SECTION "WRAM 1", WRAMX

wGBCOnlyDecompressBuffer:: ; a $540-byte buffer that continues past this SECTION

wBetaTitleSequenceOpeningType::
; This selected the title screen animation (fire/notes) in pokegold-spaceworld.
	db

wDefaultSpawnpoint:: db


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; mon buffer
UNION
wBufferMon:: party_struct wBufferMon
wBufferMonAltSpecies:: db ; the 2nd (usually redundant) species byte, for eggs
wBufferMonNickname:: ds MON_NAME_LENGTH
wBufferMonOT:: ds NAME_LENGTH
NEXTU
wEncodedBufferMon:: savemon_struct wEncodedBufferMon
ENDU

; Points towards box + slot if using GetStorageBoxMon. Slot set to 0 if empty.
wBufferMonBox:: db
wBufferMonSlot:: db

wLuckyNumberDigitsBuffer:: ds 5

wMonOrItemNameBuffer:: ds NAME_LENGTH
	ds NAME_LENGTH


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; poke seer
wSeerAction:: db
wSeerNickname:: ds MON_NAME_LENGTH
wSeerCaughtLocation:: ds 17
wSeerTimeOfDay:: ds NAME_LENGTH
wSeerOT:: ds NAME_LENGTH
wSeerOTGrammar:: db
wSeerCaughtLevelString:: ds 4
wSeerCaughtLevel:: db
wSeerCaughtData:: db
wSeerCaughtGender:: db


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; mail temp storage
wTempMail:: mailmsg wTempMail


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; bug-catching contest
wBugContestResults::
	bugcontestwinner wBugContestFirstPlace
	bugcontestwinner wBugContestSecondPlace
	bugcontestwinner wBugContestThirdPlace
wBugContestWinnersEnd::
	bugcontestwinner wBugContestTemp
	ds 4
wBugContestWinnerName:: ds NAME_LENGTH


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; mart items
wMartItem1BCD:: ds 3
wMartItem2BCD:: ds 3
wMartItem3BCD:: ds 3
wMartItem4BCD:: ds 3
wMartItem5BCD:: ds 3
wMartItem6BCD:: ds 3
wMartItem7BCD:: ds 3
wMartItem8BCD:: ds 3
wMartItem9BCD:: ds 3
wMartItem10BCD:: ds 3


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; town map data
wTownMapPlayerIconLandmark:: db
UNION
wTownMapCursorLandmark:: db
wTownMapCursorObjectPointer:: dw
NEXTU
wTownMapCursorCoordinates:: dw
wStartFlypoint:: db
wEndFlypoint:: db
ENDU


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; phone call data
wPhoneScriptBank:: db
wPhoneCaller:: dw


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; radio data
wCurRadioLine:: db
wNextRadioLine:: db
wRadioTextDelay:: db
wNumRadioLinesPrinted:: db
wOaksPKMNTalkSegmentCounter:: db
	ds 5
wRadioText:: ds 2 * SCREEN_WIDTH


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; movement buffer data
wMovementBufferCount:: db
wMovementBufferObject:: db
wUnusedMovementBufferBank:: db
wUnusedMovementBufferPointer:: dw
wMovementBuffer:: ds 55


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; box printing
wWhichBoxMonToPrint:: db
wFinishedPrintingBox:: db
wAddrOfBoxToPrint:: dw
wBankOfBoxToPrint:: db
wWhichBoxToPrint:: db


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; Unown printing
wPrintedUnownTileSource:: ds 1 tiles
wPrintedUnownTileDest:: ds 1 tiles


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; trainer HUD data
	ds 1
wPlaceBallsDirection:: db
wTrainerHUDTiles:: ds 4


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; mobile participant nicknames
	ds 4
wMobileParticipant1Nickname:: ds NAME_LENGTH_JAPANESE
wMobileParticipant2Nickname:: ds NAME_LENGTH_JAPANESE
wMobileParticipant3Nickname:: ds NAME_LENGTH_JAPANESE


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; battle exp gain
wExperienceGained:: ds 3


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; earthquake data buffer
wEarthquakeMovementDataBuffer:: ds 5


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; switching items in pack
wSwitchItemBuffer:: ds 2 ; may store 1 or 2 bytes


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; switching pokemon in party
; may store a name, partymon, or mail
wSwitchMonBuffer::
UNION
	ds NAME_LENGTH
NEXTU
	ds PARTYMON_STRUCT_LENGTH
NEXTU
	ds MAIL_STRUCT_LENGTH
ENDU


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; giving pokemon mail
wMonMailMessageBuffer:: ds MAIL_MSG_LENGTH + 1


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; bill's pc
UNION
wBoxNameBuffer:: ds BOX_NAME_LENGTH
NEXTU
	ds 1
wBillsPCTempListIndex:: db
wBillsPCTempBoxCount:: db
ENDU


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; prof. oak's pc
wTempPokedexSeenCount:: db
wTempPokedexCaughtCount:: db


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; player's room pc
UNION
wDecoNameBuffer:: ds ITEM_NAME_LENGTH
NEXTU
wNumOwnedDecoCategories:: db
wOwnedDecoCategories:: ds 16
ENDU


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; trade
wCurTradePartyMon:: db
wCurOTTradePartyMon:: db
wBufferTrademonNickname:: ds MON_NAME_LENGTH


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; link battle record data
wLinkBattleRecordBuffer::
wLinkBattleRecordName::   ds NAME_LENGTH
wLinkBattleRecordWins::   dw
wLinkBattleRecordLosses:: dw
wLinkBattleRecordDraws::  dw


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; miscellaneous
wTempDayOfWeek::
wPrevPartyLevel::
wCurBeatUpPartyMon::
wUnownPuzzleCornerTile::
wKeepSevenBiasChance::
wPokeFluteCuredSleep::
wTempRestorePPItem::
wApricorns::
wSuicuneFrame::
	db


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; debug color picker
wDebugColorIsTrainer:: db
wDebugColorIsShiny:: db
wDebugColorCurTMHM:: db


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; mobile?
wd002:: ds 1
wd003:: ds 1
	ds 19
wd030:: ds 1


SECTION UNION "Miscellaneous WRAM 1", WRAMX

; Every previous SECTION UNION takes up 60 or fewer bytes,
; except the initial "mon buffer" one.
	ds 60

UNION
; trainer data
wSeenTrainerBank:: db
wSeenTrainerDistance:: db
wSeenTrainerDirection:: db
wTempTrainer::
wTempTrainerEventFlag:: dw
wTempTrainerClass:: db
wTempTrainerID:: db
wSeenTextPointer:: dw
wWinTextPointer:: dw
wLossTextPointer:: dw
wScriptAfterPointer:: dw
wRunningTrainerBattleScript:: db
wTempTrainerEnd::

NEXTU
; menu items list
wMenuItemsList:: ds 16
wMenuItemsListEnd::

NEXTU
; fruit tree data
wCurFruitTree:: db
wCurFruit:: db

NEXTU
; item ball data
wItemBallData::
wItemBallItemID:: db
wItemBallQuantity:: db
wItemBallDataEnd::

NEXTU
; hidden item data
wHiddenItemData::
wHiddenItemEvent:: dw
wHiddenItemID:: dw
wHiddenItemDataEnd::

NEXTU
; elevator data
wElevatorData::
wElevatorPointerBank:: db
wElevatorPointer:: dw
wElevatorOriginFloor:: db
wElevatorDataEnd::

NEXTU
; coord event data
wCurCoordEvent::
wCurCoordEventSceneID:: db
wCurCoordEventMapY:: db
wCurCoordEventMapX:: db
	ds 1
wCurCoordEventScriptAddr:: dw

NEXTU
; BG event data
wCurBGEvent::
wCurBGEventYCoord:: db
wCurBGEventXCoord:: db
wCurBGEventType:: db
wCurBGEventScriptAddr:: dw

NEXTU
; mart data
wMartType:: db
wMartPointerBank:: db
wMartPointer:: dw
wMartJumptableIndex:: db
wBargainShopFlags:: db

NEXTU
; player movement data
wCurInput::
wFacingTileID:: db
wWalkingIntoNPC:: db
wWalkingIntoLand:: db
wWalkingIntoEdgeWarp:: db
wMovementAnimation:: db
wWalkingDirection:: db
wFacingDirection:: db
wWalkingX:: db
wWalkingY:: db
wWalkingTile:: db
	ds 6
wPlayerTurningDirection:: db

NEXTU
; std script buffer
	ds 1
wJumpStdScriptBuffer:: ds 3

NEXTU
; phone script data
wCheckedTime:: db
wPhoneListIndex:: db
wNumAvailableCallers:: db
wAvailableCallers:: ds CONTACT_LIST_SIZE

NEXTU
; phone caller contact
	ds 1
wCallerContact:: ds PHONE_CONTACT_SIZE

NEXTU
; backup menu data
	ds 7
wMenuCursorPositionBackup:: db
wMenuScrollPositionBackup:: db

NEXTU
; poison step data
wPoisonStepData::
wPoisonStepFlagSum:: db
wPoisonStepPartyFlags:: ds PARTY_LENGTH
wPoisonStepDataEnd::
ENDU

	ds 23


SECTION "More WRAM 1", WRAMX

wTMHMMoveNameBackup:: ds MOVE_NAME_LENGTH

wStringBuffer1:: ds STRING_BUFFER_LENGTH
wStringBuffer2:: ds STRING_BUFFER_LENGTH
wStringBuffer3:: ds STRING_BUFFER_LENGTH
wStringBuffer4:: ds STRING_BUFFER_LENGTH
wStringBuffer5:: ds STRING_BUFFER_LENGTH

wBattleMenuCursorPosition:: db

wCurBattleMon::
; index of the player's mon currently in battle (0-5)
	db

wCurMoveNum:: db

wLastPocket:: db

wPCItemsCursor::        db
wPartyMenuCursor::      db
wItemsPocketCursor::    db
wKeyItemsPocketCursor:: db
wBallsPocketCursor::    db
wTMHMPocketCursor::     db

wPCItemsScrollPosition::        db
wItemsPocketScrollPosition::    db
wKeyItemsPocketScrollPosition:: db
wBallsPocketScrollPosition::    db
wTMHMPocketScrollPosition::     db

wSwitchMon::
wSwitchItem::
wSwappingMove::
	db

wMenuScrollPosition:: ds 4

wQueuedScriptBank:: db
wQueuedScriptAddr:: dw

wNumMoves:: db

wFieldMoveSucceeded::
wItemEffectSucceeded::
wBattlePlayerAction::
; 0 - use move
; 1 - use item
; 2 - switch
wSolvedUnownPuzzle::
	db

wVramState::
; bit 0: overworld sprite updating on/off
; bit 1: something to do with sprite updates
; bit 6: something to do with text
; bit 7: on when surf initiates
;        flickers when climbing waterfall
	db

wBattleResult::
; WIN, LOSE, or DRAW
; bit 6: caught celebi
; bit 7: box full
	db
wUsingItemWithSelect:: db

UNION
; mart data
wCurMartCount:: db
wCurMartItems:: ds 15

NEXTU
; elevator data
wCurElevatorCount:: db
wCurElevatorFloors:: ds 15

NEXTU
; mailbox data
wCurMessageScrollPosition:: db
wCurMessageIndex:: db
wMailboxCount:: db
wMailboxItems:: ds MAILBOX_CAPACITY
ENDU

wListPointer:: dw
wUnusedNamesPointer:: dw

wItemAttributesPointer:: dw

wCurItem:: db
wCurItemQuantity::
wMartItemID::
	db

wCurPartySpecies:: db

wCurPartyMon::
; index of mon's party location (0-5)
	db

wWhichHPBar::
; 0: Enemy
; 1: Player
; 2: Party Menu
	db

wPokemonWithdrawDepositParameter::
; 0: Take from PC
; 1: Put into PC
; 2: Take from Day-Care
; 3: Put into Day-Care
	db

wItemQuantityChange:: db
wItemQuantity:: db

wTempMon:: party_struct wTempMon

wSpriteFlags:: db

wHandlePlayerStep:: db

wCurIconMonHasItemOrMail:: db

wPartyMenuActionText:: db

wItemAttributeValue:: db

wCurPartyLevel:: db

wScrollingMenuListSize:: db

; used when following a map warp
wNextWarp:: db
wNextMapGroup:: db
wNextMapNumber:: db
wPrevWarp:: db
wPrevMapGroup:: db
wPrevMapNumber:: db

wPlayerBGMapOffsetX:: db ; used in FollowNotExact; unit is pixels
wPlayerBGMapOffsetY:: db ; used in FollowNotExact; unit is pixels

; Player movement
wPlayerStepVectorX:: db
wPlayerStepVectorY:: db
wPlayerStepFlags:: db
wPlayerStepDirection:: db

wBGMapAnchor:: dw

UNION
wUsedSprites:: ds SPRITE_GFX_LIST_CAPACITY * 2
wUsedSpritesEnd::

NEXTU
	ds 31
wd173:: db ; related to command queue type 3
ENDU

wOverworldMapAnchor:: dw
wPlayerMetatileY:: db
wPlayerMetatileX:: db

wMapPartial::
wMapAttributesBank:: db
wMapTileset:: db
wEnvironment:: db
wMapAttributesPointer:: dw
wMapPartialEnd::

wMapAttributes::
wMapBorderBlock:: db
; width/height are in blocks (2x2 walkable tiles, 4x4 graphics tiles)
wMapHeight:: db
wMapWidth:: db
wMapBlocksBank:: db
wMapBlocksPointer:: dw
wMapScriptsBank:: db
wMapScriptsPointer:: dw
wMapEventsPointer:: dw
; bit set
wMapConnections:: db
wMapAttributesEnd::

wNorthMapConnection:: map_connection_struct wNorth
wSouthMapConnection:: map_connection_struct wSouth
wWestMapConnection::  map_connection_struct wWest
wEastMapConnection::  map_connection_struct wEast

wTileset::
wTilesetBank:: db
wTilesetAddress:: dw
wTilesetBlocksBank:: db
wTilesetBlocksAddress:: dw
wTilesetCollisionBank:: db
wTilesetCollisionAddress:: dw
wTilesetAttributesBank:: db
wTilesetAttributesAddress:: dw
wTilesetAnim:: dw ; bank 3f
wTilesetEnd::
	assert wTilesetEnd - wTileset == TILESET_LENGTH

wEvolvableFlags:: flag_array PARTY_LENGTH

wForceEvolution:: db

UNION
; general-purpose HP buffers
wHPBuffer1:: dw
wHPBuffer2:: dw
wHPBuffer3:: dw

NEXTU
; HP bar animations
wCurHPAnimMaxHP::   dw
wCurHPAnimOldHP::   dw
wCurHPAnimNewHP::   dw
wCurHPAnimPal::     db
wCurHPBarPixels::   db
wNewHPBarPixels::   db
wCurHPAnimDeltaHP:: dw
wCurHPAnimLowHP::   db
wCurHPAnimHighHP::  db

NEXTU
; move AI
wEnemyAIMoveScores:: ds NUM_MOVES

NEXTU
; switch AI
wEnemyEffectivenessVsPlayerMons:: flag_array PARTY_LENGTH
wPlayerEffectivenessVsEnemyMons:: flag_array PARTY_LENGTH

NEXTU
; battle HUD
wBattleHUDTiles:: ds PARTY_LENGTH

NEXTU
; thrown ball data
wFinalCatchRate:: db
wThrownBallWobbleCount:: db

NEXTU
; evolution data
wEvolutionOldSpecies:: db
wEvolutionNewSpecies:: db
wEvolutionPicOffset::  db
wEvolutionCanceled::   db

NEXTU
; experience
wExpToNextLevel:: ds 3

NEXTU
; PP Up
wPPUpPPBuffer:: ds NUM_MOVES

NEXTU
; lucky number show
wMonIDDigitsBuffer:: ds 5

NEXTU
; mon submenu
wMonSubmenuCount:: db
wMonSubmenuItems:: ds NUM_MONMENU_ITEMS + 1

NEXTU
; field move data
wFieldMoveData::
wFieldMoveJumptableIndex:: db
wEscapeRopeOrDigType::
wSurfingPlayerState::
wFishingRodUsed:: db
wCutWhirlpoolOverworldBlockAddr:: dw
wCutWhirlpoolReplacementBlock:: db
wCutWhirlpoolAnimationType::
wStrengthSpecies::
wFishingResult:: db
	ds 1
wFieldMoveDataEnd::

NEXTU
; hidden items
wCurMapScriptBank:: db
wRemainingBGEventCount:: db
wBottomRightYCoord:: db
wBottomRightXCoord:: db

NEXTU
; heal machine anim
wHealMachineAnimType::  db
wHealMachineTempOBP1::  db
wHealMachineAnimState:: db

NEXTU
; decorations
wCurDecoration::          db
wSelectedDecorationSide:: db
wSelectedDecoration::     db
wOtherDecoration::        db
wChangedDecorations::     db
wCurDecorationCategory::  db

NEXTU
; withdraw/deposit items
wPCItemQuantityChange:: db
wPCItemQuantity:: db

NEXTU
; mail
wCurMailAuthorID:: dw
wCurMailIndex:: db

NEXTU
; kurt
wKurtApricornCount:: db
wKurtApricornItems:: ds 10

NEXTU
; tree mons
wTreeMonCoordScore:: db
wTreeMonOTIDScore::  db

NEXTU
; restart clock
wRestartClockCurDivision::   db
wRestartClockPrevDivision::  db
wRestartClockUpArrowYCoord:: db
wRestartClockDay::  db
wRestartClockHour:: db
wRestartClockMin::  db

NEXTU
; link
	ds 9
wLinkBattleRNPreamble:: ds SERIAL_RN_PREAMBLE_LENGTH
wLinkBattleRNs:: ds SERIAL_RNS_LENGTH

NEXTU
; mobile
wd1ef:: ds 1
wd1f2:: ds 1

NEXTU
; miscellaneous bytes
wSkipMovesBeforeLevelUp::
wRegisteredPhoneNumbers::
wListMovesLineSpacing:: db
wSwitchMonTo:: db
wSwitchMonFrom:: db
	ds 4
wCurEnemyItem:: db

NEXTU
; miscellaneous words
wBuySellItemPrice::
wTempMysteryGiftTimer::
wMagikarpLength:: dw

NEXTU
; 16-bit wram
	ds 13
wOtherTrainerType:: db
wTrainerGroupBank:: db

ENDU

wTempEnemyMonSpecies::  db
wTempBattleMonSpecies:: db

UNION
wOTLinkBattleRNData:: ds SERIAL_RN_PREAMBLE_LENGTH + SERIAL_RNS_LENGTH
NEXTU
wEnemyMon:: battle_struct wEnemyMon
wEnemyMonBaseStats:: ds NUM_EXP_STATS
wEnemyMonCatchRate:: db
wEnemyMonBaseExp::   db
wEnemyMonEnd::
ENDU

wBattleMode::
; 0: overworld
; 1: wild battle
; 2: trainer battle
	db

wTempWildMonSpecies:: db

wOtherTrainerClass::
; class (Youngster, Bug Catcher, etc.) of opposing trainer
; 0 if opponent is a wild Pokémon, not a trainer
	db

; BATTLETYPE_* values
wBattleType:: db

wOtherTrainerID::
; which trainer of the class that you're fighting
; (Joey, Mikey, Albert, etc.)
	db

wForcedSwitch:: db

wTrainerClass:: db

wUnownLetter:: db

wMoveSelectionMenuType:: db

; corresponds to the data/pokemon/base_stats/*.asm contents
wCurBaseData::
wBaseSpecies:: db
wBaseStats::
wBaseHP:: db
wBaseAttack:: db
wBaseDefense:: db
wBaseSpeed:: db
wBaseSpecialAttack:: db
wBaseSpecialDefense:: db
wBaseEVs::
wBaseHPAtkDefSpdEVs:: db
wBaseSpAtkSpDefEVs:: db
wBaseType::
wBaseType1:: db
wBaseType2:: db
wBaseCatchRate:: db
wBaseExp:: db
wBaseItems::
wBaseItem1:: dw
wBaseItem2:: dw
wBaseGender:: db
wBaseEggSteps:: db
wBasePicSize:: db
wBaseGrowthRate:: db
wBaseEggGroups:: db
wBaseTMHM:: flag_array NUM_TM_HM_TUTOR
wCurBaseDataEnd::
	assert wCurBaseDataEnd - wCurBaseData == BASE_DATA_SIZE

wCurDamage:: dw

wTilesetDataAddress:: dw

wMornEncounterRate::  db
wDayEncounterRate::   db
wNiteEncounterRate::  db
wWaterEncounterRate:: db
wListMoves_MoveIndicesBuffer:: ds NUM_MOVES
wPutativeTMHMMove:: db
wInitListType:: db
wBattleHasJustStarted:: db

wNamedObjectIndex::
wTextDecimalByte::
wTempByteValue::
wNumSetBits::
wTypeMatchup::
wCurType::
wTempSpecies::
wTempIconSpecies::
wTempTMHM::
wTempPP::
wNextBoxOrPartyIndex::
wChosenCableClubRoom::
wBreedingCompatibility::
wApplyStatLevelMultipliersToEnemy::
wUsePPUp::
	db

wFailedToFlee:: db
wNumFleeAttempts:: db
wMonTriedToEvolve:: db

wTimeOfDay:: db


SECTION "Enemy Party", WRAMX

UNION
wPokedexShowPointerAddr:: dw
wPokedexShowPointerBank:: db

NEXTU
wUnusedEggHatchFlag:: db

NEXTU
; enemy party
wOTPartyData::
wOTPlayerName:: ds NAME_LENGTH
wOTPlayerID:: dw
	ds 8
wOTPartyCount::   db
wOTPartySpecies:: ds PARTY_LENGTH
wOTPartyEnd::     db ; older code doesn't check PartyCount
ENDU

UNION
; ot party mons
wOTPartyMons::
; wOTPartyMon1 - wOTPartyMon6
for n, 1, PARTY_LENGTH + 1
wOTPartyMon{d:n}:: party_struct wOTPartyMon{d:n}
endr

wOTPartyMonOTs::
; wOTPartyMon1OT - wOTPartyMon6OT
for n, 1, PARTY_LENGTH + 1
wOTPartyMon{d:n}OT:: ds NAME_LENGTH
endr

wOTPartyMonNicknames::
; wOTPartyMon1Nickname - wOTPartyMon6Nickname
for n, 1, PARTY_LENGTH + 1
wOTPartyMon{d:n}Nickname:: ds MON_NAME_LENGTH
endr
wOTPartyDataEnd::

NEXTU
; catch tutorial dude pack
wDudeNumItems:: db
wDudeItems:: ds 2 * 4 + 1

wDudeNumKeyItems:: db
wDudeKeyItems:: ds 18 + 1

wDudeNumBalls:: db
wDudeBalls:: ds 2 * 4 + 1
ENDU

wd430:: ; mobile
wBattleAction:: db

wLinkBattleSentAction:: db
wMapStatus:: db
wMapEventStatus:: db

wScriptFlags::
; bit 3: run deferred script
	db
wScriptFlags2::
; bit 0: count steps
; bit 1: coord events
; bit 2: warps and connections
; bit 4: wild encounters
; bit 5: unknown
	db

wScriptMode:: db
wScriptRunning:: db
wScriptBank:: db
wScriptPos:: dw

wScriptStackSize:: db
wScriptStack:: ds 3 * 5
wScriptDelay:: db

wDeferredScriptBank::
wScriptTextBank::
	db
wDeferredScriptAddr::
wScriptTextAddr::
	dw
wWildEncounterCooldown:: db

wXYComparePointer:: dw

wBattleScriptFlags:: db
wPlayerSpriteSetupFlags::
; bit 7: if set, cancel wPlayerAction
; bit 6: RefreshMapSprites doesn't reload player sprite
; bit 5: if set, set facing according to bits 0-1
; bit 2: female player has been transformed into male
; bits 0-1: direction facing
	db

wMapReentryScriptQueueFlag:: db
wMapReentryScriptBank:: db
wMapReentryScriptAddress:: dw

wTimeCyclesSinceLastCall:: db
wReceiveCallDelay_MinsRemaining:: db
wReceiveCallDelay_StartTime:: ds 3

wBugContestMinsRemaining:: db
wBugContestSecsRemaining:: db

wMapStatusEnd::

wCrystalData::
wPlayerGender::
; bit 0:
;	0 male
;	1 female
	db
wd473:: ds 1
wd474:: ds 1
wd475:: ds 1
wd476:: ds 1
wd477:: ds 1
wd478:: ds 1
wCrystalDataEnd::

wd479:: ds 2

wGameData::
wPlayerData::
wPlayerID:: dw

wPlayerName:: ds NAME_LENGTH
wMomsName::   ds NAME_LENGTH
wRivalName::  ds NAME_LENGTH
wRedsName::   ds NAME_LENGTH
wGreensName:: ds NAME_LENGTH

wSavedAtLeastOnce:: db
wSpawnAfterChampion:: db

; init time set at newgame
wStartDay::    db
wStartHour::   db
wStartMinute:: db
wStartSecond:: db

wRTC:: ds 4

wDST::
; bit 7: dst
	db

wGameTime:: ; used only for BANK(wGameTime)
wGameTimeCap::     db
wGameTimeHours::   dw
wGameTimeMinutes:: db
wGameTimeSeconds:: db
wGameTimeFrames::  db

wCurDay:: db

wObjectFollow_Leader:: db
wObjectFollow_Follower:: db
wCenteredObject:: db
wFollowerMovementQueueLength:: db
wFollowMovementQueue:: ds 5

wObjectStructs::
wPlayerStruct:: object_struct wPlayer ; player is object struct 0
; wObjectStruct1 - wObjectStruct12
for n, 1, NUM_OBJECT_STRUCTS
wObject{d:n}Struct:: object_struct wObject{d:n}
endr

wCmdQueue:: ds CMDQUEUE_CAPACITY * CMDQUEUE_ENTRY_SIZE

wUsedObjectPals:: db
for n, 8
wLoadedObjPal{d:n}:: db
endr
wNeededPalIndex:: db

wMapObjects::
wPlayerObject:: map_object wPlayer ; player is map object 0
; wMap1Object - wMap15Object
for n, 1, NUM_OBJECTS
wMap{d:n}Object:: map_object wMap{d:n}
endr

wObjectMasks:: ds NUM_OBJECTS

wVariableSprites:: ds $100 - SPRITE_VARS

wEnteredMapFromContinue:: db

wTimeOfDayPal:: db
wTimeOfDayPalFlags:: db
wTimeOfDayPalset:: db
wCurTimeOfDay:: db

wSecretID:: dw
wStatusFlags::
; bit 0: pokedex
; bit 1: unown dex
; bit 2: flash
; bit 3: caught pokerus
; bit 4: rocket signal
; bit 5: wild encounters on/off
; bit 6: hall of fame
; bit 7: bug contest on
	db

wStatusFlags2::
; bit 0: rockets
; bit 1: safari game (unused)
; bit 2: bug contest timer
; bit 3: unused
; bit 4: bike shop call
; bit 5: can use sweet scent
; bit 6: reached goldenrod
; bit 7: rockets in mahogany
	db

wMoney:: ds 3
wMomsMoney:: ds 3

wMomSavingMoney::
; bit 0: saving some money
; bit 1: saving half money (unused)
; bit 2: saving all money (unused)
; bit 7: active
	db

wCoins:: dw

wBadges::
wJohtoBadges:: flag_array NUM_JOHTO_BADGES
wKantoBadges:: flag_array NUM_KANTO_BADGES

wTMsHMs:: ds NUM_TMS + NUM_HMS

wNumItems:: db
wItems:: ds MAX_ITEMS * 3 + 1

wNumKeyItems:: db
wKeyItems:: ds MAX_KEY_ITEMS + 1

wNumBalls:: db
wBalls:: ds MAX_BALLS * 2 + 1

wNumPCItems:: db
wPCItems:: ds MAX_PC_ITEMS * 3 + 1

wPokegearFlags::
; bit 0: map
; bit 1: radio
; bit 2: phone
; bit 3: expn
; bit 7: on/off
	db
wRadioTuningKnob:: db
wLastDexMode:: db

wWhichRegisteredItem:: db
wRegisteredItem:: db

wPlayerState:: db

wHallOfFameCount:: db

wTradeFlags:: flag_array NUM_NPC_TRADES
wEmotePal:: db
wMooMooBerries:: db
wUndergroundSwitchPositions:: db
wFarfetchdPosition:: db

; map scene ids
wPokecenter2FSceneID::                            db
wTradeCenterSceneID::                             db
wColosseumSceneID::                               db
wTimeCapsuleSceneID::                             db
wPowerPlantSceneID::                              db
wCeruleanGymSceneID::                             db
wRoute25SceneID::                                 db
wTrainerHouseB1FSceneID::                         db
wVictoryRoadGateSceneID::                         db
wSaffronMagnetTrainStationSceneID::               db
wRoute16GateSceneID::                             db
wRoute17Route18GateSceneID::                      db
wIndigoPlateauPokecenter1FSceneID::               db
wWillsRoomSceneID::                               db
wKogasRoomSceneID::                               db
wBrunosRoomSceneID::                              db
wKarensRoomSceneID::                              db
wLancesRoomSceneID::                              db
wHallOfFameSceneID::                              db
wRoute27SceneID::                                 db
wNewBarkTownSceneID::                             db
wElmsLabSceneID::                                 db
wPlayersHouse1FSceneID::                          db
wRoute29SceneID::                                 db
wCherrygroveCitySceneID::                         db
wMrPokemonsHouseSceneID::                         db
wRoute32SceneID::                                 db
wRoute35NationalParkGateSceneID::                 db
wRoute36SceneID::                                 db
wRoute36NationalParkGateSceneID::                 db
wAzaleaTownSceneID::                              db
wGoldenrodGymSceneID::                            db
wGoldenrodMagnetTrainStationSceneID::             db
wGoldenrodPokecenter1FSceneID::                   db
wOlivineCitySceneID::                             db
wRoute34SceneID::                                 db
wRoute34IlexForestGateSceneID::                   db
wEcruteakTinTowerEntranceSceneID::                db
wWiseTriosRoomSceneID::                           db
wEcruteakPokecenter1FSceneID::                    db
wEcruteakGymSceneID::                             db
wMahoganyTownSceneID::                            db
wRoute42SceneID::                                 db
wCianwoodCitySceneID::                            db
wBattleTower1FSceneID::                           db
wBattleTowerBattleRoomSceneID::                   db
wBattleTowerElevatorSceneID::                     db
wBattleTowerHallwaySceneID::                      db
wBattleTowerOutsideSceneID::                      db
wRoute43GateSceneID::                             db
wMountMoonSceneID::                               db
wSproutTower3FSceneID::                           db
wTinTower1FSceneID::                              db
wBurnedTower1FSceneID::                           db
wBurnedTowerB1FSceneID::                          db
wRadioTower5FSceneID::                            db
wRuinsOfAlphOutsideSceneID::                      db
wRuinsOfAlphResearchCenterSceneID::               db
wRuinsOfAlphHoOhChamberSceneID::                  db
wRuinsOfAlphKabutoChamberSceneID::                db
wRuinsOfAlphOmanyteChamberSceneID::               db
wRuinsOfAlphAerodactylChamberSceneID::            db
wRuinsOfAlphInnerChamberSceneID::                 db
wMahoganyMart1FSceneID::                          db
wTeamRocketBaseB1FSceneID::                       db
wTeamRocketBaseB2FSceneID::                       db
wTeamRocketBaseB3FSceneID::                       db
wGoldenrodUndergroundSwitchRoomEntrancesSceneID:: db
wSilverCaveRoom3SceneID::                         db
wVictoryRoadSceneID::                             db
wDragonsDenB1FSceneID::                           db
wDragonShrineSceneID::                            db
wOlivinePortSceneID::                             db
wVermilionPortSceneID::                           db
wFastShip1FSceneID::                              db
wFastShipB1FSceneID::                             db
wMountMoonSquareSceneID::                         db
wMobileTradeRoomSceneID::                         db
wMobileBattleRoomSceneID::                        db

; fight counts
wJackFightCount::    db
wHueyFightCount::    db
wGavenFightCount::   db
wBethFightCount::    db
wJoseFightCount::    db
wReenaFightCount::   db
wJoeyFightCount::    db
wWadeFightCount::    db
wRalphFightCount::   db
wLizFightCount::     db
wAnthonyFightCount:: db
wToddFightCount::    db
wGinaFightCount::    db
wArnieFightCount::   db
wAlanFightCount::    db
wDanaFightCount::    db
wChadFightCount::    db
wTullyFightCount::   db
wBrentFightCount::   db
wTiffanyFightCount:: db
wVanceFightCount::   db
wWiltonFightCount::  db
wParryFightCount::   db
wErinFightCount::    db

wEventFlags:: flag_array NUM_EVENTS

wCurBox:: db

wCelebiEvent::
; bit 2: forest is restless
	db

wBikeFlags::
; bit 0: using strength
; bit 1: always on bike
; bit 2: downhill
	db
	ds 1 ; cleared along with wBikeFlags by ResetBikeFlags

wCurMapSceneScriptPointer:: dw

wCurCaller:: dw
wCurMapWarpCount:: db
wCurMapWarpsPointer:: dw
wCurMapCoordEventCount:: db
wCurMapCoordEventsPointer:: dw
wCurMapBGEventCount:: db
wCurMapBGEventsPointer:: dw
wCurMapObjectEventCount:: db
wCurMapObjectEventsPointer:: dw
wCurMapSceneScriptCount:: db
wCurMapSceneScriptsPointer:: dw
wCurMapCallbackCount:: db
wCurMapCallbacksPointer:: dw

; Sprite id of each decoration
wDecoBed::           db
wDecoCarpet::        db
wDecoPlant::         db
wDecoPoster::        db
wDecoConsole::       db
wDecoLeftOrnament::  db
wDecoRightOrnament:: db
wDecoBigDoll::       db

; Items bought from Mom
wWhichMomItem:: db
wWhichMomItemSet:: db
wMomItemTriggerBalance:: ds 3

wDailyResetTimer:: dw
wDailyFlags1:: db
wDailyFlags2:: db
wSwarmFlags:: db
wTimerEventStartDay:: db

wFruitTreeFlags:: flag_array NUM_FRUIT_TREES

wLuckyNumberDayTimer:: dw

wSpecialPhoneCallID:: db

wBugContestStartTime:: ds 4 ; day, hour, min, sec
wUnusedTwoDayTimerOn:: db
wUnusedTwoDayTimer:: db
wUnusedTwoDayTimerStartDate:: db

wMobileOrCable_LastSelection:: db
	ds 9
wBuenasPassword:: db
wBlueCardBalance:: db
wDailyRematchFlags:: ds 4
wDailyPhoneItemFlags:: ds 4
wDailyPhoneTimeOfDayFlags:: ds 4
wKenjiBreakTimer:: ds 2 ; Kenji
wYanmaMapGroup:: db
wYanmaMapNumber:: db
wPlayerMonSelection:: ds 3
	ds 2

wStepCount:: db
wPoisonStepCount:: db

wHappinessStepCount:: db


wParkBallsRemaining::
wSafariBallsRemaining:: db
wSafariTimeRemaining:: dw

wPhoneList:: ds CONTACT_LIST_SIZE + 1

wLuckyNumberShowFlag:: db
wLuckyIDNumber:: dw

wRepelEffect:: db ; If a Repel is in use, it contains the nr of steps it's still active
wBikeStep:: dw
wKurtApricornQuantity:: db

wPlayerDataEnd::

wCurMapData::

wVisitedSpawns:: flag_array NUM_SPAWNS

wDigWarpNumber:: db
wDigMapGroup::   db
wDigMapNumber::  db

; used on maps like second floor pokécenter, which are reused, so we know which
; map to return to
wBackupWarpNumber:: db
wBackupMapGroup::   db
wBackupMapNumber::  db

wLastSpawnMapGroup:: db
wLastSpawnMapNumber:: db

wWarpNumber:: db
wMapGroup:: db
wMapNumber:: db
wYCoord:: db
wXCoord:: db
wScreenSave:: ds SCREEN_META_WIDTH * SCREEN_META_HEIGHT

wCurMapDataEnd::


SECTION "Party", WRAMX

wPokemonData::

wPartyCount::   db
wPartySpecies:: ds PARTY_LENGTH
wPartyEnd::     db ; older code doesn't check wPartyCount

wPartyMons::
; wPartyMon1 - wPartyMon6
for n, 1, PARTY_LENGTH + 1
wPartyMon{d:n}:: party_struct wPartyMon{d:n}
endr

wPartyMonOTs::
; wPartyMon1OT - wPartyMon6OT
for n, 1, PARTY_LENGTH + 1
wPartyMon{d:n}OT:: ds NAME_LENGTH
endr

wPartyMonNicknames::
; wPartyMon1Nickname - wPartyMon6Nickname
for n, 1, PARTY_LENGTH + 1
wPartyMon{d:n}Nickname:: ds MON_NAME_LENGTH
endr
wPartyMonNicknamesEnd::

wPokedexCaught:: flag_array NUM_POKEMON
wEndPokedexCaught::

wPokedexSeen:: flag_array NUM_POKEMON
wEndPokedexSeen::

wUnownDex:: ds NUM_UNOWN
wUnlockedUnowns:: db
wFirstUnownSeen:: db

wDayCareMan::
; bit 7: active
; bit 6: egg ready
; bit 5: monsters are compatible
; bit 0: monster 1 in day-care
	db

wBreedMon1Nickname:: ds MON_NAME_LENGTH
wBreedMon1OT:: ds NAME_LENGTH
wBreedMon1:: box_struct wBreedMon1

wDayCareLady::
; bit 7: active
; bit 0: monster 2 in day-care
	db

wStepsToEgg::
	db
wBreedMotherOrNonDitto::
;  z: yes
; nz: no
	db

wBreedMon2Nickname:: ds MON_NAME_LENGTH
wBreedMon2OT:: ds NAME_LENGTH
wBreedMon2:: box_struct wBreedMon2

wEggMonNickname:: ds MON_NAME_LENGTH
wEggMonOT:: ds NAME_LENGTH
wEggMon:: box_struct wEggMon

wBugContestSecondPartySpecies:: db
wContestMon:: party_struct wContestMon

wDunsparceMapGroup:: db
wDunsparceMapNumber:: db
wFishingSwarmFlag:: db

wRoamMon1:: roam_struct wRoamMon1
wRoamMon2:: roam_struct wRoamMon2
wRoamMon3:: roam_struct wRoamMon3

wRoamMons_CurMapNumber:: db
wRoamMons_CurMapGroup:: db
wRoamMons_LastMapNumber:: db
wRoamMons_LastMapGroup:: db

wBestMagikarpLengthFeet:: db
wBestMagikarpLengthInches:: db
wMagikarpRecordHoldersName:: ds NAME_LENGTH

wPokemonDataEnd::
wGameDataEnd::


SECTION "Pic Animations", WRAMX

wTempTilemap::
; 20x18 grid of 8x8 tiles
	ds SCREEN_WIDTH * SCREEN_HEIGHT

; PokeAnim data
wPokeAnimStruct::
wPokeAnimSceneIndex:: db
wPokeAnimPointer:: dw
wPokeAnimSpecies:: db
wPokeAnimUnownLetter:: db
wPokeAnimSpeciesOrUnown:: db
wPokeAnimGraphicStartTile:: db
wPokeAnimCoord:: dw
wPokeAnimFrontpicHeight:: db
wPokeAnimIdleFlag:: db
wPokeAnimSpeed:: db
wPokeAnimPointerBank:: db
wPokeAnimPointerAddr:: dw
wPokeAnimFramesBank:: db
wPokeAnimFramesAddr:: dw
wPokeAnimBitmaskBank:: db
wPokeAnimBitmaskAddr:: dw
wPokeAnimFrame:: db
wPokeAnimJumptableIndex:: db
wPokeAnimRepeatTimer:: db
wPokeAnimCurBitmask:: db
wPokeAnimWaitCounter:: db
wPokeAnimCommand:: db
wPokeAnimParameter:: db
	ds 1
wPokeAnimBitmaskCurCol:: db
wPokeAnimBitmaskCurRow:: db
wPokeAnimBitmaskCurBit:: db
wPokeAnimBitmaskBuffer:: ds 7
	ds 2
wPokeAnimStructEnd::


SECTION "16-bit WRAM tables", WRAMX
; align this section to $100
	wram_conversion_table wPokemonIndexTable, MON_TABLE
	wram_conversion_table wMoveIndexTable, MOVE_TABLE
	wram_conversion_table wItemIndexTable, ITEM_TABLE


SECTION "Battle Tower RAM", WRAMX

w3_d000:: ds 1
w3_d080:: ds 1
w3_d090:: ds $70

w3_d100::
wBT_OTTrainer:: battle_tower_struct wBT_OT
	ds $20
wBT_TrainerTextIndex:: db
	ds 1
w3_d202:: battle_tower_struct w3_d202
w3_d2e2:: battle_tower_struct w3_d2e2
w3_d3c2:: battle_tower_struct w3_d3c2
w3_d4a2:: battle_tower_struct w3_d4a2
w3_d582:: battle_tower_struct w3_d582
w3_d662:: battle_tower_struct w3_d662

w3_d742:: battle_tower_struct w3_d742

UNION
;w3_d800:: ds BG_MAP_WIDTH * SCREEN_HEIGHT

NEXTU
wBTChoiceOfLvlGroup:: db
	ds $1
w3_d80e:: db
ENDU

SECTION "Metatiles", WRAMX

wDecompressedMetatiles:: ds 256 * 16


SECTION "Attributes", WRAMX

wDecompressedAttributes:: ds 256 * 16


SECTION "GBC Video", WRAMX, ALIGN[8]

; eight 4-color palettes each
wGBCPalettes:: ; used only for BANK(wGBCPalettes)
wBGPals1:: ds 8 palettes
wOBPals1:: ds 8 palettes
wBGPals2:: ds 8 palettes
wOBPals2:: ds 8 palettes

	align 8
wLYOverrides:: ds SCREEN_HEIGHT_PX
wLYOverridesEnd::

	ds 1

wMagnetTrain:: ; used only for BANK(wMagnetTrain)
wMagnetTrainDirection:: db
wMagnetTrainInitPosition:: db
wMagnetTrainHoldPosition:: db
wMagnetTrainFinalPosition:: db
wMagnetTrainPlayerSpriteInitX:: db

wPalFadeDelayFrames:: db
wPalFadeDelay:: db

	ds 104

	align 8
wLYOverridesBackup:: ds SCREEN_HEIGHT_PX
wLYOverridesBackupEnd::


SECTION "Used Storage", WRAMX

wPokeDBUsedEntries::
wPokeDB1UsedEntries:: flag_array MONDB_ENTRIES
wPokeDB2UsedEntries:: flag_array MONDB_ENTRIES
wPokeDBUsedEntriesEnd::


SECTION "Battle Animations", WRAMX

wBattleAnimTileDict::
; wBattleAnimTileDict pairs keys with values
; keys: BATTLE_ANIM_GFX_* indexes (taken from anim_*gfx arguments)
; values: vTiles0 offsets
	ds NUM_BATTLEANIMTILEDICT_ENTRIES * 2

wActiveAnimObjects::
; wAnimObject1 - wAnimObject10
for n, 1, NUM_BATTLE_ANIM_STRUCTS + 1
wAnimObject{d:n}:: battle_anim_struct wAnimObject{d:n}
endr

wActiveBGEffects::
; wBGEffect1 - wBGEffect5
for n, 1, NUM_BG_EFFECTS + 1
wBGEffect{d:n}:: battle_bg_effect wBGEffect{d:n}
endr

wLastAnimObjectIndex:: db

wBattleAnimFlags:: db
wBattleAnimAddress:: dw
wBattleAnimBank:: db
wBattleAnimDelay:: db
wBattleAnimParent:: dw
wBattleAnimParentBank:: db
wBattleAnimLoops:: db
wBattleAnimVar:: db
wBattleAnimByte:: db
wBattleAnimOAMPointerLo:: db

UNION
wBattleObjectTempID:: dw
wBattleObjectTempXCoord:: db
wBattleObjectTempYCoord:: db
wBattleObjectTempParam:: db

NEXTU
wBattleBGEffectTempID:: db
wBattleBGEffectTempJumptableIndex:: db
wBattleBGEffectTempTurn:: db
wBattleBGEffectTempParam:: db

NEXTU
wBattleAnimTempOAMFlags:: db
wBattleAnimTempFixY:: db
wBattleAnimTempTileID:: db
wBattleAnimTempXCoord:: db
wBattleAnimTempYCoord:: db
wBattleAnimTempXOffset:: db
wBattleAnimTempYOffset:: db
wBattleAnimTempFrameOAMFlags:: db
wBattleAnimTempPalette:: db

NEXTU
wBattleAnimGFXTempTileID::
wBattleAnimGFXTempPicHeight:: db

NEXTU
wBattleSineWaveTempProgress:: db
wBattleSineWaveTempOffset:: db
wBattleSineWaveTempAmplitude:: db
wBattleSineWaveTempTimer:: db

NEXTU
wBattlePicResizeTempBaseTileID:: db
wBattlePicResizeTempPointer:: dw
ENDU

UNION
	ds 50
wBattleAnimEnd::

NEXTU
wSurfWaveBGEffect:: ds $40
wSurfWaveBGEffectEnd::
ENDU


SECTION "Pokedex Listings", WRAMX

wPokedexOrder:: ds 2 * (NUM_POKEMON + 1) ; enough room to expand to 1,407 entries


SECTION "Scratch RAM", WRAMX

UNION
wScratchTilemap:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT
wScratchAttrmap:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT

NEXTU
wDecompressScratch:: ds $100 tiles

NEXTU

	ds $80 tiles
wDecompressEnemyFrontpic:: ds $80 tiles

NEXTU
; unidentified uses
w6_d000:: ds $1000
ENDU


SECTION "Stack RAM", WRAMX

wWindowStack:: ds $1000 - 1
wWindowStackBottom:: ds 1

ENDSECTION
