{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 89.0, 71.0, 764.0, 535.0 ],
		"bglocked" : 0,
		"defrect" : [ 89.0, 71.0, 764.0, 535.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 10.0,
		"default_fontface" : 0,
		"default_fontname" : "Courier",
		"gridonopen" : 0,
		"gridsize" : [ 5.0, 5.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"metadata" : [  ],
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "message",
					"prototypename" : "Instructive",
					"text" : "timesig 8 4",
					"fontname" : "Courier",
					"gradient" : 1,
					"bgcolor" : [ 0.741176, 1.0, 0.6, 1.0 ],
					"patching_rect" : [ 265.0, 125.0, 77.0, 14.0 ],
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"id" : "obj-39",
					"bgcolor2" : [ 0.203922, 0.690196, 0.176471, 1.0 ],
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "set up starting script",
					"fontname" : "Courier",
					"patching_rect" : [ 515.0, 385.0, 150.0, 16.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"id" : "obj-38",
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "NOTE: if using global transport, set the time signature to 8/4. (In ReWire, the host must also use 8/4.)",
					"linecount" : 4,
					"fontname" : "Courier",
					"patching_rect" : [ 350.0, 115.0, 210.0, 46.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"id" : "obj-35",
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "bpatcher",
					"border" : 1,
					"patching_rect" : [ 5.0, 5.0, 343.0, 107.0 ],
					"numinlets" : 0,
					"numoutlets" : 0,
					"id" : "obj-33",
					"args" : [  ],
					"name" : "GlobalTransport.maxpat"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "pick the sync source",
					"fontname" : "Courier",
					"patching_rect" : [ 5.0, 125.0, 150.0, 16.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"id" : "obj-32",
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p RatherMessyAnimationPatcher",
					"fontname" : "Courier",
					"patching_rect" : [ 335.0, 415.0, 185.0, 16.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"id" : "obj-30",
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 171.0, 130.0, 641.0, 553.0 ],
						"bglocked" : 0,
						"defrect" : [ 171.0, 130.0, 641.0, 553.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Courier",
						"gridonopen" : 0,
						"gridsize" : [ 5.0, 5.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"metadata" : [  ],
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "This is something we should really code up in Python: the scrolling animation",
									"linecount" : 4,
									"fontname" : "Courier",
									"patching_rect" : [ 150.0, 45.0, 150.0, 46.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"id" : "obj-5",
									"frgb" : [ 0.0, 0.0, 0.0, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "umenu",
									"fontname" : "Courier",
									"types" : [  ],
									"patching_rect" : [ 470.0, 305.0, 100.0, 16.0 ],
									"items" : [ 1, 0, ",", -1, 0, ",", 0, 1, ",", 0, -1 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 3,
									"id" : "obj-2",
									"outlettype" : [ "int", "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "random 4",
									"fontname" : "Courier",
									"patching_rect" : [ 470.0, 280.0, 59.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"id" : "obj-3",
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pack 0 0 0 0 0",
									"fontname" : "Courier",
									"patching_rect" : [ 320.0, 355.0, 95.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 5,
									"numoutlets" : 1,
									"id" : "obj-39",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "int",
									"fontname" : "Courier",
									"patching_rect" : [ 305.0, 265.0, 32.5, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"id" : "obj-38",
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b i",
									"fontname" : "Courier",
									"patching_rect" : [ 365.0, 150.0, 41.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"id" : "obj-36",
									"outlettype" : [ "bang", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "gswitch",
									"patching_rect" : [ 185.0, 435.0, 41.0, 32.0 ],
									"numinlets" : 3,
									"numoutlets" : 1,
									"id" : "obj-65",
									"int" : 1,
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"patching_rect" : [ 365.0, 180.0, 20.0, 20.0 ],
									"numinlets" : 1,
									"numoutlets" : 1,
									"id" : "obj-64",
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "change",
									"fontname" : "Courier",
									"patching_rect" : [ 365.0, 100.0, 47.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 3,
									"id" : "obj-62",
									"outlettype" : [ "", "int", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"fontname" : "Courier",
									"patching_rect" : [ 365.0, 125.0, 50.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"id" : "obj-59",
									"outlettype" : [ "int", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "umenu",
									"fontname" : "Courier",
									"types" : [  ],
									"patching_rect" : [ 350.0, 305.0, 100.0, 16.0 ],
									"items" : [ 1, 0, ",", -1, 0, ",", 0, 1, ",", 0, -1 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 3,
									"id" : "obj-57",
									"outlettype" : [ "int", "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t i b",
									"fontname" : "Courier",
									"patching_rect" : [ 50.0, 250.0, 41.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"id" : "obj-56",
									"outlettype" : [ "int", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sel 7",
									"fontname" : "Courier",
									"patching_rect" : [ 50.0, 275.0, 41.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 2,
									"id" : "obj-55",
									"outlettype" : [ "bang", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "change",
									"fontname" : "Courier",
									"patching_rect" : [ 230.0, 235.0, 47.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 3,
									"id" : "obj-53",
									"outlettype" : [ "", "int", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "b 2",
									"fontname" : "Courier",
									"patching_rect" : [ 230.0, 165.0, 32.5, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"id" : "obj-49",
									"outlettype" : [ "bang", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t i b b b b",
									"fontname" : "Courier",
									"patching_rect" : [ 275.0, 210.0, 77.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 5,
									"id" : "obj-48",
									"outlettype" : [ "int", "bang", "bang", "bang", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "set 0",
									"fontname" : "Courier",
									"patching_rect" : [ 215.0, 120.0, 41.0, 14.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"id" : "obj-47",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"patching_rect" : [ 230.0, 315.0, 20.0, 20.0 ],
									"numinlets" : 1,
									"numoutlets" : 1,
									"id" : "obj-44",
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "toggle",
									"patching_rect" : [ 230.0, 255.0, 20.0, 20.0 ],
									"numinlets" : 1,
									"numoutlets" : 1,
									"id" : "obj-42",
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "1",
									"fontname" : "Courier",
									"patching_rect" : [ 275.0, 185.0, 32.5, 14.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"id" : "obj-40",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "0",
									"fontname" : "Courier",
									"patching_rect" : [ 230.0, 210.0, 32.5, 14.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"id" : "obj-37",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "metro 70",
									"fontname" : "Courier",
									"patching_rect" : [ 230.0, 285.0, 59.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"id" : "obj-34",
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "counter 0 7",
									"fontname" : "Courier",
									"patching_rect" : [ 170.0, 140.0, 77.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 5,
									"numoutlets" : 4,
									"id" : "obj-28",
									"outlettype" : [ "int", "", "", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "prepend prepare",
									"fontname" : "Courier",
									"patching_rect" : [ 320.0, 380.0, 101.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 1,
									"id" : "obj-26",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "random 4",
									"fontname" : "Courier",
									"patching_rect" : [ 350.0, 280.0, 59.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"id" : "obj-1",
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "done",
									"fontname" : "Courier",
									"patching_rect" : [ 50.0, 300.0, 35.0, 14.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"id" : "obj-14",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "nudge",
									"fontname" : "Courier",
									"patching_rect" : [ 95.0, 300.0, 41.0, 14.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"id" : "obj-11",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 365.0, 50.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"id" : "obj-25",
									"outlettype" : [ "int" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 185.0, 480.0, 25.0, 25.0 ],
									"numinlets" : 1,
									"numoutlets" : 0,
									"id" : "obj-29",
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-65", 0 ],
									"destination" : [ "obj-29", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-25", 0 ],
									"destination" : [ "obj-62", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 1 ],
									"destination" : [ "obj-39", 3 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-57", 1 ],
									"destination" : [ "obj-39", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-38", 0 ],
									"destination" : [ "obj-39", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-39", 0 ],
									"destination" : [ "obj-26", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-48", 4 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-48", 0 ],
									"destination" : [ "obj-53", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-40", 0 ],
									"destination" : [ "obj-48", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-48", 1 ],
									"destination" : [ "obj-47", 0 ],
									"hidden" : 0,
									"midpoints" : [ 299.0, 230.0, 338.0, 230.0, 338.0, 111.0, 224.5, 111.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-48", 3 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-48", 2 ],
									"destination" : [ "obj-38", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-36", 0 ],
									"destination" : [ "obj-64", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-36", 1 ],
									"destination" : [ "obj-38", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-59", 0 ],
									"destination" : [ "obj-36", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-42", 0 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 0 ],
									"destination" : [ "obj-44", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-14", 0 ],
									"destination" : [ "obj-65", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-65", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-26", 0 ],
									"destination" : [ "obj-65", 2 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-64", 0 ],
									"destination" : [ "obj-40", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-62", 0 ],
									"destination" : [ "obj-59", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-57", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-56", 0 ],
									"destination" : [ "obj-55", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-56", 1 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-28", 0 ],
									"destination" : [ "obj-56", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-55", 0 ],
									"destination" : [ "obj-14", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-53", 0 ],
									"destination" : [ "obj-42", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-37", 0 ],
									"destination" : [ "obj-53", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-49", 1 ],
									"destination" : [ "obj-37", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-28", 2 ],
									"destination" : [ "obj-49", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-47", 0 ],
									"destination" : [ "obj-28", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-44", 0 ],
									"destination" : [ "obj-28", 0 ],
									"hidden" : 0,
									"midpoints" : [ 239.5, 342.0, 153.0, 342.0, 153.0, 131.0, 179.5, 131.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontsize" : 10.0,
						"fontname" : "Courier",
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Courier"
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "tab",
					"fontname" : "Courier",
					"tabcolor" : [ 0.811765, 1.0, 0.627451, 1.0 ],
					"patching_rect" : [ 5.0, 145.0, 128.0, 31.0 ],
					"htabcolor" : [ 0.164706, 0.52549, 0.254902, 1.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 3,
					"htextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-15",
					"outlettype" : [ "int", "", "" ],
					"tabs" : [ "global transport", "ReWire" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Nick Rothwell, nick@cassiel.com / nick@loadbang.net",
					"fontname" : "Courier",
					"patching_rect" : [ 365.0, 65.0, 318.0, 16.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"id" : "obj-10",
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "the UFO animation sequence",
					"fontname" : "Courier",
					"patching_rect" : [ 365.0, 50.0, 363.0, 16.0 ],
					"textcolor" : [ 0.992157, 0.992157, 0.992157, 1.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"id" : "obj-24",
					"frgb" : [ 0.992157, 0.992157, 0.992157, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"mode" : 1,
					"border" : 2,
					"patching_rect" : [ 360.0, 45.0, 370.0, 40.0 ],
					"rounded" : 20,
					"numinlets" : 1,
					"angle" : 90.0,
					"numoutlets" : 0,
					"grad1" : [ 0.74902, 0.74902, 0.74902, 1.0 ],
					"id" : "obj-13",
					"grad2" : [ 0.556863, 0.556863, 0.556863, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "SHADO",
					"fontname" : "BlairMdITC TT Medium",
					"gradient" : 1,
					"bgcolor" : [ 0.384314, 0.384314, 0.384314, 1.0 ],
					"patching_rect" : [ 600.0, 5.0, 131.0, 33.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fontsize" : 24.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"id" : "obj-7",
					"bgcolor2" : [ 0.0, 0.0, 0.0, 1.0 ],
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/sys/report",
					"fontname" : "Courier",
					"patching_rect" : [ 460.0, 275.0, 77.0, 14.0 ],
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"id" : "obj-12",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/sys/prefix /shado, /sys/cable 0 right",
					"fontname" : "Courier",
					"patching_rect" : [ 505.0, 295.0, 239.0, 14.0 ],
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"id" : "obj-8",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpsend localhost 8080",
					"fontname" : "Courier",
					"patching_rect" : [ 505.0, 325.0, 143.0, 16.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"id" : "obj-6"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 3",
					"fontname" : "Courier",
					"patching_rect" : [ 260.0, 210.0, 53.0, 16.0 ],
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"id" : "obj-5",
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p TransportSync",
					"fontname" : "Courier",
					"patching_rect" : [ 170.0, 170.0, 101.0, 16.0 ],
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"id" : "obj-23",
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 414.0, 245.0, 285.0, 366.0 ],
						"bglocked" : 0,
						"defrect" : [ 414.0, 245.0, 285.0, 366.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Courier",
						"gridonopen" : 0,
						"gridsize" : [ 5.0, 5.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"metadata" : [  ],
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 220.0, 40.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"id" : "obj-6",
									"outlettype" : [ "" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pack 0 0",
									"fontname" : "Courier",
									"patching_rect" : [ 50.0, 240.0, 59.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"id" : "obj-54",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"fontname" : "Courier",
									"patching_rect" : [ 110.0, 205.0, 50.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"id" : "obj-7",
									"outlettype" : [ "int", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"fontname" : "Courier",
									"patching_rect" : [ 50.0, 205.0, 50.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"id" : "obj-5",
									"outlettype" : [ "int", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "metro 8n @quantize 8n",
									"fontname" : "Courier",
									"patching_rect" : [ 50.0, 100.0, 137.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"id" : "obj-156",
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"patching_rect" : [ 50.0, 140.0, 20.0, 20.0 ],
									"numinlets" : 1,
									"numoutlets" : 1,
									"id" : "obj-36",
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "transport",
									"fontname" : "Courier",
									"patching_rect" : [ 50.0, 175.0, 113.5, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 8,
									"id" : "obj-10",
									"outlettype" : [ "int", "int", "float", "float", "float", "", "int", "float" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 55.0, 40.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"id" : "obj-20",
									"outlettype" : [ "int" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 55.0, 316.0, 25.0, 25.0 ],
									"numinlets" : 1,
									"numoutlets" : 0,
									"id" : "obj-21",
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-54", 0 ],
									"destination" : [ "obj-21", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 0 ],
									"destination" : [ "obj-156", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-10", 1 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-10", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-156", 0 ],
									"destination" : [ "obj-36", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-36", 0 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-54", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-54", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [ 229.5, 166.0, 59.5, 166.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontsize" : 10.0,
						"fontname" : "Courier",
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Courier"
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p HostSync",
					"fontname" : "Courier",
					"patching_rect" : [ 230.0, 265.0, 71.0, 16.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"id" : "obj-16",
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 333.0, 124.0, 269.0, 378.0 ],
						"bglocked" : 0,
						"defrect" : [ 333.0, 124.0, 269.0, 378.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Courier",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 5.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"metadata" : [  ],
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "inlet",
									"patching_rect" : [ 15.0, 15.0, 25.0, 25.0 ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"id" : "obj-4",
									"outlettype" : [ "bang" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "1",
									"fontname" : "Courier",
									"patching_rect" : [ 60.0, 145.0, 32.5, 14.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"id" : "obj-5",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "print A",
									"fontname" : "Courier",
									"patching_rect" : [ 150.0, 315.0, 53.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"id" : "obj-1"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"patching_rect" : [ 30.0, 195.0, 20.0, 20.0 ],
									"numinlets" : 1,
									"numoutlets" : 1,
									"id" : "obj-52",
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"patching_rect" : [ 105.0, 195.0, 20.0, 20.0 ],
									"numinlets" : 1,
									"numoutlets" : 1,
									"id" : "obj-50",
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t i b",
									"fontname" : "Courier",
									"patching_rect" : [ 30.0, 125.0, 41.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"id" : "obj-45",
									"outlettype" : [ "int", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"fontname" : "Courier",
									"patching_rect" : [ 30.0, 170.0, 50.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"id" : "obj-35",
									"outlettype" : [ "int", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "set $1",
									"fontname" : "Courier",
									"patching_rect" : [ 90.0, 125.0, 47.0, 14.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"id" : "obj-32",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b i",
									"fontname" : "Courier",
									"patching_rect" : [ 150.0, 135.0, 41.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"id" : "obj-30",
									"outlettype" : [ "bang", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"fontname" : "Courier",
									"patching_rect" : [ 105.0, 170.0, 50.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"id" : "obj-29",
									"outlettype" : [ "int", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sel 1",
									"fontname" : "Courier",
									"patching_rect" : [ 150.0, 105.0, 41.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 2,
									"id" : "obj-24",
									"outlettype" : [ "bang", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"patching_rect" : [ 165.0, 195.0, 20.0, 20.0 ],
									"numinlets" : 1,
									"numoutlets" : 1,
									"id" : "obj-20",
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"fontname" : "Courier",
									"patching_rect" : [ 165.0, 170.0, 50.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"id" : "obj-13",
									"outlettype" : [ "int", "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pack 0 0",
									"fontname" : "Courier",
									"patching_rect" : [ 75.0, 230.0, 59.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"id" : "obj-8",
									"outlettype" : [ "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "change",
									"fontname" : "Courier",
									"patching_rect" : [ 150.0, 65.0, 47.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 3,
									"id" : "obj-6",
									"outlettype" : [ "", "int", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "change",
									"fontname" : "Courier",
									"patching_rect" : [ 90.0, 65.0, 47.0, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 3,
									"id" : "obj-3",
									"outlettype" : [ "", "int", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "hostsync~",
									"fontname" : "Courier",
									"patching_rect" : [ 75.0, 25.0, 140.5, 16.0 ],
									"fontsize" : 10.0,
									"numinlets" : 1,
									"numoutlets" : 10,
									"id" : "obj-2",
									"outlettype" : [ "int", "int", "int", "float", "list", "float", "float", "int", "list", "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 80.0, 306.0, 25.0, 25.0 ],
									"numinlets" : 1,
									"numoutlets" : 0,
									"id" : "obj-12",
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 1 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 2 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-20", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-24", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-24", 1 ],
									"destination" : [ "obj-30", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-30", 1 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-30", 0 ],
									"destination" : [ "obj-29", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-32", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-32", 0 ],
									"destination" : [ "obj-29", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-45", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-45", 0 ],
									"destination" : [ "obj-35", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-29", 0 ],
									"destination" : [ "obj-50", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-35", 0 ],
									"destination" : [ "obj-52", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-35", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-29", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-8", 1 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-45", 1 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-12", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontsize" : 10.0,
						"fontname" : "Courier",
						"globalpatchername" : "",
						"fontface" : 0,
						"fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Courier"
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gswitch",
					"patching_rect" : [ 160.0, 300.0, 41.0, 32.0 ],
					"numinlets" : 3,
					"numoutlets" : 1,
					"id" : "obj-60",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack 0 0",
					"fontname" : "Courier",
					"patching_rect" : [ 170.0, 360.0, 71.0, 16.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"id" : "obj-58",
					"outlettype" : [ "int", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clock $1",
					"fontname" : "Courier",
					"patching_rect" : [ 320.0, 240.0, 59.0, 14.0 ],
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"id" : "obj-69",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b i",
					"fontname" : "Courier",
					"patching_rect" : [ 170.0, 390.0, 41.0, 16.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"id" : "obj-27",
					"outlettype" : [ "bang", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pack sync 0 0",
					"fontname" : "Courier",
					"patching_rect" : [ 170.0, 455.0, 89.0, 16.0 ],
					"fontsize" : 10.0,
					"numinlets" : 3,
					"numoutlets" : 1,
					"id" : "obj-22",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "counter",
					"fontname" : "Courier",
					"patching_rect" : [ 320.0, 205.0, 73.0, 16.0 ],
					"fontsize" : 10.0,
					"numinlets" : 5,
					"numoutlets" : 4,
					"id" : "obj-19",
					"outlettype" : [ "int", "", "", "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"patching_rect" : [ 170.0, 125.0, 30.0, 30.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"id" : "obj-17",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 10",
					"fontname" : "Courier",
					"patching_rect" : [ 320.0, 170.0, 59.0, 16.0 ],
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"id" : "obj-18",
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "placeholder shado-tapestry, clear, run runner",
					"fontname" : "Courier",
					"gradient" : 1,
					"bgcolor" : [ 0.741176, 1.0, 0.6, 1.0 ],
					"patching_rect" : [ 360.0, 360.0, 281.0, 14.0 ],
					"fontsize" : 10.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"id" : "obj-4",
					"bgcolor2" : [ 0.203922, 0.690196, 0.176471, 1.0 ],
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "mxj net.loadbang.jython.mxj.ScriptEngine @placeholder shado-tapestry",
					"fontname" : "Courier",
					"patching_rect" : [ 275.0, 490.0, 419.0, 16.0 ],
					"fontsize" : 10.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"id" : "obj-9",
					"outlettype" : [ "", "" ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [ 179.5, 165.0, 281.0, 165.0, 281.0, 204.0, 269.5, 204.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [ 369.5, 394.0, 284.5, 394.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-60", 0 ],
					"destination" : [ "obj-58", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 1 ],
					"destination" : [ "obj-22", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 1 ],
					"destination" : [ "obj-22", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [ 179.5, 160.0, 329.5, 160.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-69", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-60", 2 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-60", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"midpoints" : [ 14.5, 284.0, 169.5, 284.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 1 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 0 ],
					"destination" : [ "obj-23", 1 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
 ]
	}

}
