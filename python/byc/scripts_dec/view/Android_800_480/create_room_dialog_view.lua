create_room_dialog_view=
{
	name="create_room_dialog_view",type=0,typeName="View",time=0,x=0,y=0,width=720,height=1280,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="create_room_view_bg",type=1,typeName="Image",time=16170358,x=0,y=-100,width=720,height=1190,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="common/background/dialog_bg_1.png",gridLeft=128,gridRight=128,gridTop=128,gridBottom=128,
		{
			name="room_name_error_icon",type=1,typeName="Image",time=17129178,x=647,y=175,width=18,height=18,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="drawable/input_error_icon.png",
			{
				name="input_room_name_text_label",type=4,typeName="Text",time=17120702,x=-465,y=49,width=240,height=24,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=24,textAlign=kAlignLeft,colorRed=200,colorGreen=40,colorBlue=40,string=[[房间名不能为特殊字符]]
			}
		},
		{
			name="pwd_error_icon",type=1,typeName="Image",time=17129263,x=647,y=285,width=18,height=18,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="drawable/input_error_icon.png",
			{
				name="input_pwd_text_label",type=4,typeName="Text",time=17128821,x=-465,y=58,width=348,height=24,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=24,textAlign=kAlignLeft,colorRed=200,colorGreen=40,colorBlue=40,string=[[密码只能为4到10位的英文、数字]]
			}
		},
		{
			name="create_room_ok_btn",type=2,typeName="Button",time=24831578,x=0,y=130,width=571,height=97,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="common/button/dialog_btn_2_normal.png",file2="common/button/dialog_btn_2_press.png",
			{
				name="create_room_ok_texture",type=4,typeName="Text",time=24831654,x=0,y=0,width=166,height=66,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=40,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255,string=[[创建房间]]
			}
		},
		{
			name="second_time_view",type=0,typeName="View",time=96026043,x=0,y=265,width=720,height=100,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignBottom,
			{
				name="slider_view",type=0,typeName="View",time=96026044,x=0,y=0,width=507,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
				{
					name="Image3",type=1,typeName="Image",time=96026045,x=0,y=-1,width=492,height=3,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="online/room/dialog/line_bg.png"
				},
				{
					name="View1",type=0,typeName="View",time=96026046,x=-35,y=0,width=72,height=72,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,
					{
						name="point1",type=1,typeName="Image",time=96026047,x=0,y=0,width=26,height=25,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="online/room/dialog/point.png"
					},
					{
						name="btn_1",type=2,typeName="Button",time=96026048,x=0,y=0,width=52,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="ui/button.png"
					},
					{
						name="time_text1",type=4,typeName="Text",time=96026049,x=0,y=-26,width=56,height=28,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=28,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255,string=[[30秒]]
					}
				},
				{
					name="View2",type=0,typeName="View",time=96026050,x=0,y=0,width=72,height=72,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
					{
						name="point2",type=1,typeName="Image",time=96026051,x=0,y=0,width=26,height=25,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="online/room/dialog/point.png"
					},
					{
						name="btn_2",type=2,typeName="Button",time=96026052,x=0,y=0,width=52,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="ui/button.png"
					},
					{
						name="time_text2",type=4,typeName="Text",time=96026053,x=0,y=-26,width=56,height=28,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=28,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255,string=[[60秒]]
					}
				},
				{
					name="View3",type=0,typeName="View",time=96026054,x=-37,y=0,width=72,height=72,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,
					{
						name="point3",type=1,typeName="Image",time=96026055,x=0,y=0,width=26,height=25,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="online/room/dialog/point.png"
					},
					{
						name="btn_3",type=2,typeName="Button",time=96026056,x=0,y=0,width=52,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="ui/button.png"
					},
					{
						name="time_text3",type=4,typeName="Text",time=96026057,x=0,y=-23,width=70,height=28,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=28,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255,string=[[120秒]]
					}
				},
				{
					name="choiceIcon",type=1,typeName="Image",time=96026058,x=-50,y=5,width=96,height=71,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file="online/room/dialog/choice_icon.png"
				}
			},
			{
				name="Text211",type=4,typeName="Text",time=96026059,x=64,y=-21,width=85,height=36,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=34,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[读 秒]]
			},
			{
				name="Text1111",type=4,typeName="Text",time=111314768,x=179,y=-18,width=840,height=36,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=24,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[(局时超时后每步可用时间)]]
			}
		},
		{
			name="step_time_view",type=0,typeName="View",time=96026112,x=0,y=421,width=720,height=100,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignBottom,
			{
				name="slider_view",type=0,typeName="View",time=96026113,x=0,y=0,width=510,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
				{
					name="Image3",type=1,typeName="Image",time=96026114,x=0,y=0,width=500,height=3,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="online/room/dialog/line_bg.png"
				},
				{
					name="View1",type=0,typeName="View",time=96026115,x=-35,y=0,width=72,height=72,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,
					{
						name="point1",type=1,typeName="Image",time=96026116,x=0,y=0,width=26,height=25,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="online/room/dialog/point.png"
					},
					{
						name="btn_1",type=2,typeName="Button",time=96026117,x=0,y=0,width=52,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="ui/button.png"
					},
					{
						name="time_text1",type=4,typeName="Text",time=96026118,x=0,y=-23,width=56,height=28,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=28,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255,string=[[30秒]]
					}
				},
				{
					name="View2",type=0,typeName="View",time=96026119,x=134,y=0,width=72,height=72,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,
					{
						name="point2",type=1,typeName="Image",time=96026120,x=0,y=0,width=26,height=25,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="online/room/dialog/point.png"
					},
					{
						name="btn_2",type=2,typeName="Button",time=96026121,x=0,y=0,width=52,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="ui/button.png"
					},
					{
						name="time_text2",type=4,typeName="Text",time=96026122,x=0,y=-25,width=70,height=28,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=28,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255,string=[[1分钟]]
					}
				},
				{
					name="View3",type=0,typeName="View",time=96026123,x=305,y=0,width=72,height=72,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,
					{
						name="point3",type=1,typeName="Image",time=96026124,x=0,y=0,width=26,height=25,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="online/room/dialog/point.png"
					},
					{
						name="btn_3",type=2,typeName="Button",time=96026125,x=0,y=0,width=52,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="ui/button.png"
					},
					{
						name="time_text3",type=4,typeName="Text",time=96026126,x=0,y=-24,width=70,height=28,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=28,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255,string=[[2分钟]]
					}
				},
				{
					name="View4",type=0,typeName="View",time=96026127,x=-36,y=0,width=72,height=72,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,
					{
						name="point4",type=1,typeName="Image",time=96026128,x=0,y=0,width=26,height=25,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="online/room/dialog/point.png"
					},
					{
						name="btn_4",type=2,typeName="Button",time=96026129,x=0,y=0,width=52,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="ui/button.png"
					},
					{
						name="time_text4",type=4,typeName="Text",time=96026130,x=0,y=-23,width=70,height=28,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=28,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255,string=[[3分钟]]
					}
				},
				{
					name="choiceIcon",type=1,typeName="Image",time=96026131,x=458,y=4,width=96,height=71,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file="online/room/dialog/choice_icon.png"
				}
			},
			{
				name="Text21",type=4,typeName="Text",time=96026132,x=64,y=-21,width=85,height=36,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=34,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[步 时]]
			},
			{
				name="Text111",type=4,typeName="Text",time=111314732,x=179,y=-21,width=408,height=36,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=24,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[(局时内每步可用时间)]]
			}
		},
		{
			name="game_time_view",type=0,typeName="View",time=96026185,x=0,y=577,width=720,height=100,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignBottom,
			{
				name="slider_view",type=0,typeName="View",time=96026186,x=0,y=-1,width=503,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
				{
					name="Image3",type=1,typeName="Image",time=96026187,x=0,y=0,width=525,height=3,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="online/room/dialog/line_bg.png"
				},
				{
					name="View1",type=0,typeName="View",time=96026188,x=-37,y=0,width=72,height=72,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,
					{
						name="point1",type=1,typeName="Image",time=96026189,x=0,y=0,width=26,height=25,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="online/room/dialog/point.png"
					},
					{
						name="btn_1",type=2,typeName="Button",time=96026190,x=0,y=0,width=52,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="ui/button.png"
					},
					{
						name="time_text1",type=4,typeName="Text",time=96026191,x=0,y=-25,width=84,height=28,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=28,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255,string=[[10分钟]]
					}
				},
				{
					name="View2",type=0,typeName="View",time=96026192,x=134,y=0,width=72,height=72,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,
					{
						name="point2",type=1,typeName="Image",time=96026193,x=0,y=0,width=26,height=25,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="online/room/dialog/point.png"
					},
					{
						name="btn_2",type=2,typeName="Button",time=96026194,x=0,y=0,width=52,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="ui/button.png"
					},
					{
						name="time_text2",type=4,typeName="Text",time=96026195,x=0,y=-25,width=84,height=28,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=28,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255,string=[[20分钟]]
					}
				},
				{
					name="View3",type=0,typeName="View",time=96026196,x=305,y=0,width=72,height=72,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,
					{
						name="point3",type=1,typeName="Image",time=96026197,x=0,y=-1,width=26,height=25,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="online/room/dialog/point.png"
					},
					{
						name="btn_3",type=2,typeName="Button",time=96026198,x=0,y=0,width=52,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="ui/button.png"
					},
					{
						name="time_text3",type=4,typeName="Text",time=96026199,x=0,y=-25,width=84,height=28,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=28,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255,string=[[30分钟]]
					}
				},
				{
					name="View4",type=0,typeName="View",time=96026200,x=-36,y=0,width=72,height=72,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,
					{
						name="point4",type=1,typeName="Image",time=96026201,x=3,y=0,width=26,height=25,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="online/room/dialog/point.png"
					},
					{
						name="btn_4",type=2,typeName="Button",time=96026202,x=0,y=0,width=52,height=52,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="ui/button.png"
					},
					{
						name="time_text4",type=4,typeName="Text",time=96026203,x=0,y=-24,width=84,height=28,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=28,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255,string=[[60分钟]]
					}
				},
				{
					name="choiceIcon",type=1,typeName="Image",time=96026204,x=120,y=4,width=96,height=71,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file="online/room/dialog/choice_icon.png"
				}
			},
			{
				name="Text1",type=4,typeName="Text",time=111314599,x=64,y=-21,width=85,height=36,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=34,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[局 时]]
			},
			{
				name="Text11",type=4,typeName="Text",time=111314619,x=179,y=-21,width=432,height=36,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=24,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[(不读秒时,棋局可用时间)]]
			}
		},
		{
			name="Text1",type=4,typeName="Text",time=96026416,x=0,y=50,width=187,height=44,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,fontSize=44,textAlign=kAlignCenter,colorRed=80,colorGreen=80,colorBlue=80,string=[[创建房间]]
		},
		{
			name="Image2",type=1,typeName="Image",time=96026484,x=0,y=114,width=640,height=19,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/decoration/line.png"
		},
		{
			name="Image4",type=1,typeName="Image",time=96026517,x=0,y=473,width=616,height=2,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/decoration/line_2.png"
		},
		{
			name="Text3",type=4,typeName="Text",time=96026584,x=50,y=169,width=96,height=33,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=32,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[房间名]]
		},
		{
			name="Text31",type=4,typeName="Text",time=96026637,x=62,y=282,width=80,height=33,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=32,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[密 码]]
		},
		{
			name="Text311",type=4,typeName="Text",time=96026639,x=63,y=405,width=80,height=33,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=32,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[底 注]]
		},
		{
			name="input_name_bg",type=1,typeName="Image",time=96026703,x=180,y=153,width=450,height=62,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/background/input_bg_2.png",gridLeft=33,gridRight=33,gridTop=0,gridBottom=0,
			{
				name="edit",type=6,typeName="EditText",time=96026775,x=16,y=0,width=442,height=73,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=32,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[]]
			}
		},
		{
			name="input_pwd_bg",type=1,typeName="Image",time=96026823,x=180,y=266,width=450,height=62,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/background/input_bg_2.png",gridLeft=33,gridRight=33,gridTop=0,gridBottom=0,
			{
				name="edit",type=6,typeName="EditText",time=96026824,x=16,y=0,width=439,height=76,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=32,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[]]
			}
		},
		{
			name="input_dizhu_bg",type=1,typeName="Image",time=96026825,x=180,y=390,width=450,height=62,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/background/input_bg_1.png",gridLeft=33,gridRight=33,gridTop=0,gridBottom=0,
			{
				name="edit",type=6,typeName="EditText",time=96026826,x=16,y=0,width=438,height=76,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=32,textAlign=kAlignLeft,colorRed=125,colorGreen=80,colorBlue=65,string=[[500金币]]
			}
		},
		{
			name="close_btn",type=2,typeName="Button",time=102138814,x=34,y=39,width=60,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file="common/button/btn_close.png"
		}
	}
}