{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 24.0, 55.0, 451.0, 489.0 ],
		"bgcolor" : [ 0.701961, 0.701961, 0.701961, 1.0 ],
		"bglocked" : 0,
		"defrect" : [ 24.0, 55.0, 451.0, 489.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 1,
		"default_fontsize" : 10.0,
		"default_fontface" : 0,
		"default_fontname" : "Courier",
		"gridonopen" : 0,
		"gridsize" : [ 5.0, 5.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 610.0, 395.0, 59.0, 16.0 ],
					"id" : "obj-17",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "exec maxObject.outlet(0\\, ['doc'\\, __doc__])",
					"outlettype" : [ "" ],
					"patching_rect" : [ 560.0, 715.0, 275.0, 14.0 ],
					"id" : "obj-52",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend set ABOUT",
					"outlettype" : [ "" ],
					"patching_rect" : [ 765.0, 300.0, 113.0, 16.0 ],
					"id" : "obj-99",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "ABOUT Cross",
					"patching_rect" : [ 765.0, 330.0, 150.0, 16.0 ],
					"presentation" : 1,
					"id" : "obj-96",
					"fontname" : "Courier",
					"fontface" : 1,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"presentation_rect" : [ 190.0, 355.0, 150.0, 16.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "regexp (.+)\\\\.[^.]+$",
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 790.0, 585.0, 131.0, 16.0 ],
					"id" : "obj-86",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 5
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 825.0, 515.0, 20.0, 20.0 ],
					"id" : "obj-83",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "set -1",
					"outlettype" : [ "" ],
					"patching_rect" : [ 825.0, 540.0, 47.0, 14.0 ],
					"id" : "obj-79",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "tab",
					"prototypename" : "c3g.DarkLabel",
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 550.0, 485.0, 135.0, 20.0 ],
					"clicktabcolor" : [ 0.156863, 0.643137, 0.156863, 1.0 ],
					"presentation" : 1,
					"id" : "obj-72",
					"fontname" : "Courier Bold",
					"rounded" : 6.0,
					"tabcolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"textcolor" : [ 0.701961, 0.701961, 0.701961, 1.0 ],
					"tabs" : [ "reload python" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"border" : 1,
					"htextcolor" : [ 0.94902, 1.0, 0.0, 1.0 ],
					"presentation_rect" : [ 190.0, 440.0, 175.0, 20.0 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "tab",
					"prototypename" : "c3g.DarkLabel",
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 85.0, 630.0, 135.0, 20.0 ],
					"clicktabcolor" : [ 0.156863, 0.643137, 0.156863, 1.0 ],
					"presentation" : 1,
					"id" : "obj-55",
					"fontname" : "Courier Bold",
					"rounded" : 6.0,
					"tabcolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"textcolor" : [ 0.701961, 0.701961, 0.701961, 1.0 ],
					"tabs" : [ "create MIDI menu" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"border" : 1,
					"htextcolor" : [ 0.94902, 1.0, 0.0, 1.0 ],
					"presentation_rect" : [ 20.0, 425.0, 150.0, 20.0 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 585.0, 430.0, 20.0, 20.0 ],
					"id" : "obj-54",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "tab",
					"prototypename" : "c3g.DarkLabel",
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 545.0, 360.0, 135.0, 20.0 ],
					"clicktabcolor" : [ 0.156863, 0.643137, 0.156863, 1.0 ],
					"presentation" : 1,
					"id" : "obj-51",
					"fontname" : "Courier Bold",
					"rounded" : 6.0,
					"tabcolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"textcolor" : [ 0.701961, 0.701961, 0.701961, 1.0 ],
					"tabs" : [ "list text files" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"border" : 1,
					"hovertabcolor" : [ 0.6, 0.180392, 0.180392, 1.0 ],
					"htextcolor" : [ 0.94902, 1.0, 0.0, 1.0 ],
					"presentation_rect" : [ 190.0, 315.0, 175.0, 20.0 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "regexp (.*[\\\\\\\\/])[^\\\\\\\\/]+",
					"outlettype" : [ "", "", "", "", "" ],
					"patching_rect" : [ 710.0, 440.0, 173.0, 16.0 ],
					"id" : "obj-40",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 5
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend prefix",
					"outlettype" : [ "" ],
					"patching_rect" : [ 750.0, 460.0, 95.0, 16.0 ],
					"id" : "obj-42",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "shado-workbench.PLACE_HOLDER",
					"outlettype" : [ "" ],
					"patching_rect" : [ 710.0, 395.0, 179.0, 14.0 ],
					"id" : "obj-45",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "absolutepath",
					"outlettype" : [ "" ],
					"patching_rect" : [ 710.0, 420.0, 83.0, 16.0 ],
					"id" : "obj-46",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 750.0, 485.0, 138.0, 16.0 ],
					"presentation" : 1,
					"id" : "obj-49",
					"autopopulate" : 1,
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"presentation_rect" : [ 190.0, 335.0, 175.0, 16.0 ],
					"prefix_mode" : 2,
					"items" : [ "Animate.py", ",", "BlinkTest.py", ",", "Buttons.py", ",", "config.py", ",", "Counter.py", ",", "Cross.py", ",", "d_Buttons.py", ",", "d_FirstBlink.py", ",", "d_HelloWorld.py", ",", "Migrate.py", ",", "RaiseLower.py", ",", "shado-workbench.PLACE_HOLDER", ",", "Simple.py", ",", "Simple2.py", ",", "Tiles.py" ],
					"numoutlets" : 3,
					"prefix" : "Sultanahmet:/Users/nick/CASSIEL/MAXSEARCH/machines/monome/shado/workbench/",
					"types" : "TEXT"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "fromsymbol",
					"outlettype" : [ "" ],
					"patching_rect" : [ 315.0, 345.0, 71.0, 16.0 ],
					"id" : "obj-44",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess -",
					"outlettype" : [ "" ],
					"patching_rect" : [ 820.0, 225.0, 71.0, 16.0 ],
					"id" : "obj-43",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "Draw a cross for the last pressed button.",
					"presentation_linecount" : 2,
					"outlettype" : [ "" ],
					"patching_rect" : [ 180.0, 380.0, 293.0, 14.0 ],
					"presentation" : 1,
					"id" : "obj-39",
					"fontname" : "Courier",
					"bgcolor" : [ 0.6, 0.6, 0.6, 1.0 ],
					"ignoreclick" : 1,
					"bgcolor2" : [ 0.6, 0.6, 0.6, 1.0 ],
					"gradient" : 1,
					"fontsize" : 10.0,
					"numinlets" : 2,
					"presentation_rect" : [ 190.0, 370.0, 171.0, 24.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "tab",
					"prototypename" : "c3g.DarkLabel",
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 415.0, 435.0, 135.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-110",
					"fontname" : "Courier Bold",
					"rounded" : 6.0,
					"tabcolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"textcolor" : [ 0.701961, 0.701961, 0.701961, 1.0 ],
					"ignoreclick" : 1,
					"tabs" : [ "interaction" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"presentation_rect" : [ 15.0, 245.0, 155.0, 20.0 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate",
					"outlettype" : [ "" ],
					"patching_rect" : [ 435.0, 725.0, 35.0, 16.0 ],
					"id" : "obj-107",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 85.0, 660.0, 20.0, 20.0 ],
					"id" : "obj-104",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 85.0, 730.0, 170.0, 16.0 ],
					"presentation" : 1,
					"id" : "obj-102",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"presentation_rect" : [ 20.0, 445.0, 150.0, 16.0 ],
					"items" : [ "AU DLS Synth 1", ",", "IAC Driver IAC_1", ",", "OasysPCI", ",", "MIDISPORT 2x2 Port B", ",", "P3", ",", "to MonomeSerial 1", ",", "from MaxMSP 1", ",", "from MaxMSP 2", ",", "ReWire 1", ",", "ReWire 2" ],
					"numoutlets" : 3,
					"types" : [  ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "midiinfo",
					"outlettype" : [ "" ],
					"patching_rect" : [ 85.0, 705.0, 59.0, 16.0 ],
					"id" : "obj-101",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"outlettype" : [ "" ],
					"patching_rect" : [ 85.0, 685.0, 32.5, 14.0 ],
					"id" : "obj-100",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "nslider",
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 715.0, 540.0, 60.0, 158.399994 ],
					"presentation" : 1,
					"id" : "obj-92",
					"ignoreclick" : 1,
					"numinlets" : 2,
					"presentation_rect" : [ 110.0, 265.0, 60.0, 158.399994 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 0 0 0 0",
					"outlettype" : [ "int", "int", "int", "int" ],
					"patching_rect" : [ 265.0, 695.0, 95.0, 16.0 ],
					"id" : "obj-91",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 4
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route note doc",
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 265.0, 670.0, 95.0, 16.0 ],
					"id" : "obj-90",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "noteout",
					"patching_rect" : [ 265.0, 750.0, 53.0, 16.0 ],
					"id" : "obj-89",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 3,
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "makenote",
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 265.0, 720.0, 59.0, 16.0 ],
					"id" : "obj-12",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 3,
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "tab",
					"prototypename" : "c3g.DarkLabel",
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 400.0, 420.0, 135.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-88",
					"fontname" : "Courier Bold",
					"rounded" : 6.0,
					"tabcolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"textcolor" : [ 0.701961, 0.701961, 0.701961, 1.0 ],
					"ignoreclick" : 1,
					"tabs" : [ "available scripts" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"presentation_rect" : [ 185.0, 200.0, 180.0, 20.0 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clock $1",
					"outlettype" : [ "" ],
					"patching_rect" : [ 230.0, 350.0, 59.0, 14.0 ],
					"id" : "obj-84",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "manual 10msec metronome",
					"linecount" : 3,
					"presentation_linecount" : 3,
					"patching_rect" : [ 20.0, 440.0, 72.0, 36.0 ],
					"presentation" : 1,
					"id" : "obj-82",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"presentation_rect" : [ 20.0, 195.0, 71.0, 36.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "metro sends a bang",
					"patching_rect" : [ 90.0, 540.0, 150.0, 16.0 ],
					"id" : "obj-80",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 490.0, 550.0, 20.0, 20.0 ],
					"id" : "obj-78",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "button press",
					"linecount" : 2,
					"patching_rect" : [ 445.0, 600.0, 51.0, 26.0 ],
					"presentation" : 1,
					"id" : "obj-73",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"presentation_rect" : [ 20.0, 270.0, 85.0, 16.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "led",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 425.0, 615.0, 20.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-71",
					"ignoreclick" : 1,
					"numinlets" : 1,
					"presentation_rect" : [ 50.0, 290.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear",
					"outlettype" : [ "" ],
					"patching_rect" : [ 325.0, 560.0, 41.0, 14.0 ],
					"id" : "obj-47",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b s b",
					"outlettype" : [ "bang", "", "bang" ],
					"patching_rect" : [ 265.0, 530.0, 53.0, 16.0 ],
					"id" : "obj-48",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 425.0, 590.0, 20.0, 20.0 ],
					"id" : "obj-59",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "tab",
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 170.0, 415.0, 200.0, 100.0 ],
					"presentation" : 1,
					"id" : "obj-60",
					"fontname" : "Courier",
					"tabs" : [ "Simple", "Simple2", "RaiseLower", "Migrate", "Tiles", "Animate", "Counter", "Buttons", "BlinkTest", "Cross" ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"presentation_rect" : [ 185.0, 220.0, 180.0, 75.0 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend run",
					"linecount" : 2,
					"outlettype" : [ "" ],
					"patching_rect" : [ 265.0, 560.0, 57.0, 26.0 ],
					"id" : "obj-62",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "placeholder shado-workbench",
					"outlettype" : [ "" ],
					"patching_rect" : [ 490.0, 580.0, 173.0, 14.0 ],
					"id" : "obj-63",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 100.0, 440.0, 30.0, 30.0 ],
					"presentation" : 1,
					"id" : "obj-64",
					"numinlets" : 1,
					"presentation_rect" : [ 140.0, 200.0, 30.0, 30.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend press",
					"outlettype" : [ "" ],
					"patching_rect" : [ 395.0, 525.0, 89.0, 16.0 ],
					"id" : "obj-65",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route /shado/grid/key",
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 395.0, 505.0, 137.0, 16.0 ],
					"id" : "obj-66",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpreceive 8000",
					"outlettype" : [ "" ],
					"color" : [ 0.945098, 0.913725, 0.407843, 1.0 ],
					"patching_rect" : [ 395.0, 485.0, 110.0, 16.0 ],
					"id" : "obj-67",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "mxj net.loadbang.jython.mxj.ScriptEngine @placeholder shado-workbench",
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 235.0, 645.0, 425.0, 16.0 ],
					"id" : "obj-68",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 100.0, 565.0, 30.0, 30.0 ],
					"id" : "obj-69",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 10",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 100.0, 475.0, 64.0, 16.0 ],
					"id" : "obj-70",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "location",
					"patching_rect" : [ 510.0, 205.0, 150.0, 16.0 ],
					"presentation" : 1,
					"id" : "obj-41",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"presentation_rect" : [ 165.0, 150.0, 65.0, 16.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "tempo",
					"patching_rect" : [ 510.0, 185.0, 150.0, 16.0 ],
					"presentation" : 1,
					"id" : "obj-23",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"presentation_rect" : [ 180.0, 170.0, 45.0, 16.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 435.0, 145.0, 50.0, 16.0 ],
					"id" : "obj-13",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "!/ 7500",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 435.0, 125.0, 53.0, 16.0 ],
					"id" : "obj-8",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "tab",
					"prototypename" : "c3g.DarkLabel",
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 525.0, 310.0, 135.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-61",
					"fontname" : "Courier Bold",
					"rounded" : 6.0,
					"tabcolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"textcolor" : [ 0.701961, 0.701961, 0.701961, 1.0 ],
					"ignoreclick" : 1,
					"tabs" : [ "manual clock" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"presentation_rect" : [ 15.0, 150.0, 120.0, 20.0 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "tab",
					"prototypename" : "c3g.DarkLabel",
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 525.0, 285.0, 135.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-53",
					"fontname" : "Courier Bold",
					"rounded" : 6.0,
					"tabcolor" : [ 0.4, 0.4, 0.4, 1.0 ],
					"textcolor" : [ 0.701961, 0.701961, 0.701961, 1.0 ],
					"ignoreclick" : 1,
					"tabs" : [ "host sync lock" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"presentation_rect" : [ 15.0, 110.0, 120.0, 20.0 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"outlettype" : [ "" ],
					"patching_rect" : [ 300.0, 200.0, 32.5, 14.0 ],
					"id" : "obj-57",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 300.0, 180.0, 41.0, 16.0 ],
					"id" : "obj-58",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"outlettype" : [ "" ],
					"patching_rect" : [ 250.0, 200.0, 32.5, 14.0 ],
					"id" : "obj-56",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 250.0, 180.0, 41.0, 16.0 ],
					"id" : "obj-50",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "change",
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 125.0, 180.0, 47.0, 16.0 ],
					"id" : "obj-94",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "change",
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 175.0, 180.0, 47.0, 16.0 ],
					"id" : "obj-93",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 435.0, 105.0, 50.0, 16.0 ],
					"presentation" : 1,
					"id" : "obj-28",
					"fontname" : "Courier",
					"maximum" : 200,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"presentation_rect" : [ 220.0, 170.0, 50.0, 16.0 ],
					"numoutlets" : 2,
					"minimum" : 30
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 1",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 455.0, 295.0, 32.5, 16.0 ],
					"id" : "obj-38",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+ 1",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 390.0, 295.0, 32.5, 16.0 ],
					"id" : "obj-37",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "% 4",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 455.0, 275.0, 32.5, 16.0 ],
					"id" : "obj-36",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "/ 8",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 390.0, 245.0, 32.5, 16.0 ],
					"id" : "obj-35",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 230.0, 310.0, 107.0, 22.0 ],
					"id" : "obj-34",
					"fontname" : "Courier",
					"ignoreclick" : 1,
					"triangle" : 0,
					"fontsize" : 16.0,
					"numinlets" : 1,
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gswitch",
					"outlettype" : [ "" ],
					"patching_rect" : [ 230.0, 250.0, 70.0, 30.0 ],
					"id" : "obj-33",
					"int" : 1,
					"numinlets" : 3,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "/ 4",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 390.0, 275.0, 32.5, 16.0 ],
					"id" : "obj-32",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 455.0, 320.0, 28.0, 22.0 ],
					"presentation" : 1,
					"id" : "obj-30",
					"fontname" : "Courier",
					"ignoreclick" : 1,
					"triangle" : 0,
					"fontface" : 1,
					"fontsize" : 16.0,
					"numinlets" : 1,
					"presentation_rect" : [ 335.0, 150.0, 28.0, 22.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 390.0, 320.0, 63.0, 22.0 ],
					"presentation" : 1,
					"id" : "obj-31",
					"fontname" : "Courier",
					"ignoreclick" : 1,
					"triangle" : 0,
					"fontface" : 1,
					"fontsize" : 16.0,
					"numinlets" : 1,
					"presentation_rect" : [ 270.0, 150.0, 63.0, 22.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 365.0, 150.0, 20.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-25",
					"numinlets" : 1,
					"presentation_rect" : [ 140.0, 150.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 435.0, 180.0, 50.0, 16.0 ],
					"presentation" : 1,
					"id" : "obj-22",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"presentation_rect" : [ 220.0, 150.0, 50.0, 16.0 ],
					"numoutlets" : 2,
					"minimum" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "counter",
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 365.0, 215.0, 73.0, 16.0 ],
					"id" : "obj-20",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 5,
					"numoutlets" : 4
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 60",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 365.0, 180.0, 59.0, 16.0 ],
					"id" : "obj-19",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "running $1",
					"outlettype" : [ "" ],
					"patching_rect" : [ 140.0, 350.0, 71.0, 14.0 ],
					"id" : "obj-15",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "change",
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 125.0, 255.0, 47.0, 16.0 ],
					"id" : "obj-10",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 155.0, 215.0, 28.0, 22.0 ],
					"presentation" : 1,
					"id" : "obj-9",
					"fontname" : "Courier",
					"ignoreclick" : 1,
					"triangle" : 0,
					"fontface" : 1,
					"fontsize" : 16.0,
					"numinlets" : 1,
					"presentation_rect" : [ 335.0, 110.0, 28.0, 22.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 90.0, 215.0, 63.0, 22.0 ],
					"presentation" : 1,
					"id" : "obj-6",
					"fontname" : "Courier",
					"ignoreclick" : 1,
					"triangle" : 0,
					"fontface" : 1,
					"fontsize" : 16.0,
					"numinlets" : 1,
					"presentation_rect" : [ 270.0, 110.0, 63.0, 22.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "led",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 65.0, 215.0, 20.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-5",
					"ignoreclick" : 1,
					"numinlets" : 1,
					"presentation_rect" : [ 245.0, 110.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 80.0, 90.0, 20.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-21",
					"numinlets" : 1,
					"presentation_rect" : [ 140.0, 110.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 3",
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 80.0, 120.0, 53.0, 16.0 ],
					"id" : "obj-2",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "* 8.",
					"outlettype" : [ "float" ],
					"patching_rect" : [ 200.0, 200.0, 35.0, 16.0 ],
					"id" : "obj-16",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "change",
					"outlettype" : [ "", "int", "int" ],
					"patching_rect" : [ 230.0, 285.0, 47.0, 16.0 ],
					"id" : "obj-14",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "int",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 200.0, 220.0, 32.5, 16.0 ],
					"id" : "obj-11",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "hostsync~",
					"outlettype" : [ "int", "int", "int", "float", "list", "float", "float", "int", "list", "int" ],
					"patching_rect" : [ 125.0, 145.0, 140.5, 16.0 ],
					"id" : "obj-3",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 10
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "$Id: workbench.maxpat,v 84e5bf762cf4 2011/05/24 10:37:37 nick $",
					"patching_rect" : [ 280.0, 60.0, 387.0, 16.0 ],
					"presentation" : 1,
					"id" : "obj-1",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"presentation_rect" : [ 12.0, 80.0, 387.0, 16.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Nick Rothwell, nick@cassiel.com / nick@loadbang.net",
					"patching_rect" : [ 280.0, 45.0, 335.0, 16.0 ],
					"presentation" : 1,
					"id" : "obj-26",
					"fontname" : "Courier",
					"fontsize" : 10.0,
					"numinlets" : 1,
					"presentation_rect" : [ 12.0, 65.0, 335.0, 16.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "workbench for the shado compositing and sprite library",
					"patching_rect" : [ 280.0, 30.0, 335.0, 16.0 ],
					"presentation" : 1,
					"id" : "obj-24",
					"fontname" : "Courier",
					"textcolor" : [ 0.992157, 0.992157, 0.992157, 1.0 ],
					"frgb" : [ 0.992157, 0.992157, 0.992157, 1.0 ],
					"fontface" : 1,
					"fontsize" : 10.0,
					"numinlets" : 1,
					"presentation_rect" : [ 12.0, 50.0, 335.0, 16.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 275.0, 25.0, 350.0, 55.0 ],
					"presentation" : 1,
					"id" : "obj-27",
					"rounded" : 20,
					"grad1" : [ 0.74902, 0.74902, 0.74902, 1.0 ],
					"angle" : 90.0,
					"grad2" : [ 0.556863, 0.556863, 0.556863, 1.0 ],
					"mode" : 1,
					"numinlets" : 1,
					"border" : 2,
					"presentation_rect" : [ 10.0, 45.0, 360.0, 55.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "SHADO",
					"outlettype" : [ "" ],
					"patching_rect" : [ 25.0, 25.0, 131.0, 33.0 ],
					"presentation" : 1,
					"id" : "obj-18",
					"fontname" : "BlairMdITC TT Medium",
					"bgcolor" : [ 0.384314, 0.384314, 0.384314, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"ignoreclick" : 1,
					"bgcolor2" : [ 0.0, 0.0, 0.0, 1.0 ],
					"gradient" : 1,
					"fontsize" : 24.0,
					"numinlets" : 2,
					"presentation_rect" : [ 10.0, 10.0, 360.0, 33.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 530.0, 250.0, 30.0, 30.0 ],
					"presentation" : 1,
					"id" : "obj-4",
					"bgcolor" : [ 0.6, 0.6, 0.6, 1.0 ],
					"bordercolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"border" : 1,
					"presentation_rect" : [ 10.0, 105.0, 360.0, 35.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 570.0, 250.0, 30.0, 30.0 ],
					"presentation" : 1,
					"id" : "obj-7",
					"bgcolor" : [ 0.6, 0.6, 0.6, 1.0 ],
					"bordercolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"border" : 1,
					"presentation_rect" : [ 10.0, 145.0, 360.0, 45.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 610.0, 250.0, 30.0, 30.0 ],
					"presentation" : 1,
					"id" : "obj-85",
					"bgcolor" : [ 0.6, 0.6, 0.6, 1.0 ],
					"bordercolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"border" : 1,
					"presentation_rect" : [ 180.0, 195.0, 190.0, 270.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 690.0, 250.0, 30.0, 30.0 ],
					"presentation" : 1,
					"id" : "obj-108",
					"bgcolor" : [ 0.6, 0.6, 0.6, 1.0 ],
					"bordercolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"border" : 1,
					"presentation_rect" : [ 10.0, 240.0, 165.0, 225.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 650.0, 250.0, 30.0, 30.0 ],
					"presentation" : 1,
					"id" : "obj-109",
					"bgcolor" : [ 0.6, 0.6, 0.6, 1.0 ],
					"bordercolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"border" : 1,
					"presentation_rect" : [ 10.0, 195.0, 165.0, 40.0 ],
					"numoutlets" : 0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-67", 0 ],
					"destination" : [ "obj-66", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 0 ],
					"destination" : [ "obj-65", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-52", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 2 ],
					"destination" : [ "obj-47", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 1 ],
					"destination" : [ "obj-99", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 1 ],
					"destination" : [ "obj-62", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-60", 1 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-86", 1 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-90", 1 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-52", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-99", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-99", 0 ],
					"destination" : [ "obj-96", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-49", 1 ],
					"destination" : [ "obj-83", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-49", 1 ],
					"destination" : [ "obj-86", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-83", 0 ],
					"destination" : [ "obj-79", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-79", 0 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-78", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-55", 0 ],
					"destination" : [ "obj-104", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 0 ],
					"destination" : [ "obj-45", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-51", 0 ],
					"destination" : [ "obj-54", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 0 ],
					"destination" : [ "obj-46", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-46", 0 ],
					"destination" : [ "obj-40", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 1 ],
					"destination" : [ "obj-42", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-49", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-94", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 1 ],
					"destination" : [ "obj-94", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-93", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 2 ],
					"destination" : [ "obj-93", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 6 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-38", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-37", 0 ],
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-37", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-32", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-33", 1 ],
					"hidden" : 0,
					"midpoints" : [ 209.5, 240.0, 265.0, 240.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-33", 2 ],
					"hidden" : 0,
					"midpoints" : [ 374.5, 237.0, 290.5, 237.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-20", 3 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-50", 0 ],
					"destination" : [ "obj-56", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-56", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-50", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-57", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-57", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-58", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-19", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-64", 0 ],
					"destination" : [ "obj-70", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-70", 0 ],
					"destination" : [ "obj-69", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-65", 0 ],
					"destination" : [ "obj-59", 0 ],
					"hidden" : 0,
					"midpoints" : [ 404.5, 585.0, 434.5, 585.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-34", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-59", 0 ],
					"destination" : [ "obj-71", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-78", 0 ],
					"destination" : [ "obj-63", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-34", 0 ],
					"destination" : [ "obj-84", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-84", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 239.5, 371.0, 387.0, 371.0, 387.0, 552.0, 378.0, 552.0, 378.0, 603.0, 244.5, 603.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-47", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 334.5, 630.0, 244.5, 630.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 109.5, 623.0, 244.5, 623.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-63", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 499.5, 637.0, 244.5, 637.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-65", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 404.5, 614.0, 361.0, 614.0, 361.0, 637.0, 244.5, 637.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-91", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-91", 1 ],
					"destination" : [ "obj-12", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-91", 2 ],
					"destination" : [ "obj-12", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-91", 3 ],
					"destination" : [ "obj-89", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 1 ],
					"destination" : [ "obj-89", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-89", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-100", 0 ],
					"destination" : [ "obj-101", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-101", 0 ],
					"destination" : [ "obj-102", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-102", 1 ],
					"destination" : [ "obj-89", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-104", 0 ],
					"destination" : [ "obj-100", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-91", 1 ],
					"destination" : [ "obj-107", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-91", 0 ],
					"destination" : [ "obj-107", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-107", 0 ],
					"destination" : [ "obj-92", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-90", 0 ],
					"destination" : [ "obj-91", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-68", 0 ],
					"destination" : [ "obj-90", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-39", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-44", 0 ],
					"destination" : [ "obj-39", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-54", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
