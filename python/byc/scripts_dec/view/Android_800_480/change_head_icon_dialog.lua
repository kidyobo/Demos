change_head_icon_dialog=
{
	name="change_head_icon_dialog",type=0,typeName="View",time=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=81398085,x=0,y=0,width=720,height=750,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="common/background/dialog_bg_1.png",gridLeft=128,gridRight=128,gridTop=128,gridBottom=128,
		{
			name="headIconBg",type=1,typeName="Image",time=81398183,x=0,y=62,width=210,height=210,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/background/head_bg_210.png",
			{
				name="Image2",type=1,typeName="Image",time=97208032,x=0,y=0,width=201,height=201,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="common/decoration/select_chose_200.png"
			}
		},
		{
			name="customBtn",type=2,typeName="Button",time=81398830,x=0,y=30,width=571,height=97,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="common/button/dialog_btn_6_normal.png",file2="common/button/dialog_btn_6_press.png",gridLeft=60,gridRight=60,gridTop=0,gridBottom=0,
			{
				name="Text3",type=4,typeName="Text",time=81398925,x=0,y=-2,width=0,height=20,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=40,textAlign=kAlignLeft,colorRed=240,colorGreen=240,colorBlue=240,string=[[自定义头像]]
			}
		},
		{
			name="confirm",type=2,typeName="Button",time=81398576,x=0,y=153,width=571,height=97,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="common/button/dialog_btn_2_normal.png",file2="common/button/dialog_btn_2_press.png",gridLeft=64,gridRight=64,gridTop=0,gridBottom=0,
			{
				name="Text2",type=4,typeName="Text",time=81398760,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=40,textAlign=kAlignLeft,colorRed=240,colorGreen=240,colorBlue=240,string=[[确 定]]
			}
		},
		{
			name="defaultIconGroup",type=0,typeName="View",time=81399942,x=0,y=302,width=600,height=138,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,
			{
				name="item1",type=1,typeName="Image",time=81400095,x=6,y=0,width=130,height=130,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file="common/background/head_bg_130.png"
			},
			{
				name="item2",type=1,typeName="Image",time=81400225,x=159,y=0,width=130,height=130,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file="common/background/head_bg_130.png"
			},
			{
				name="item3",type=1,typeName="Image",time=81400229,x=311,y=0,width=130,height=130,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file="common/background/head_bg_130.png"
			},
			{
				name="item4",type=1,typeName="Image",time=81400231,x=464,y=0,width=130,height=130,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,file="common/background/head_bg_130.png"
			},
			{
				name="seleted",type=1,typeName="Image",time=81400001,x=0,y=0,width=136,height=136,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/decoration/select_chose.png"
			}
		},
		{
			name="close_btn",type=2,typeName="Button",time=102136663,x=37,y=42,width=60,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file="common/button/btn_close.png"
		}
	}
}