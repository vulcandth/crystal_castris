	db 0 ; species ID placeholder

	db  90,  90,  85, 100, 125,  90
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, FLYING ; type
	db 3 ; catch rate
	db 216 ; base exp
	dw MIRACLEBERRY, MIRACLEBERRY ; items
	db GENDER_UNKNOWN ; gender ratio
	INCBIN "gfx/pokemon/zapdos/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	; tm/hm learnset
	tmhm CURSE, ROAR, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, THUNDER, RETURN, MUD_SLAP, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, SANDSTORM, SWIFT, DETECT, REST, STEEL_WING, FLY, FLASH, THUNDERBOLT
	; end
