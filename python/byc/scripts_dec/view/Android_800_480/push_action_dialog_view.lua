push_action_dialog_view=
{
	name="push_action_dialog_view",type=0,typeName="View",time=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=112939568,x=0,y=0,width=720,height=900,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="common/background/dialog_bg_2.png",gridLeft=128,gridRight=128,gridTop=128,gridBottom=128,
		{
			name="close_btn",type=2,typeName="Button",time=112939616,x=46,y=43,width=60,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file="common/button/btn_close.png"
		},
		{
			name="Text1",type=4,typeName="Text",time=112939641,x=0,y=0,width=200,height=150,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,fontSize=38,textAlign=kAlignCenter,colorRed=80,colorGreen=80,colorBlue=80,string=[[活动推荐]]
		},
		{
			name="Image1",type=1,typeName="Image",time=112939682,x=0,y=130,width=640,height=19,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/decoration/line.png"
		},
		{
			name="content_bg",type=1,typeName="Image",time=112939730,x=0,y=183,width=630,height=500,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/background/line_bg.png",gridLeft=64,gridRight=64,gridTop=64,gridBottom=64,
			{
				name="scroll_view",type=0,typeName="ScrollView",time=112940056,x=0,y=13,width=600,height=479,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop
			}
		},
		{
			name="confirm_btn",type=2,typeName="Button",time=112939788,x=0,y=72,width=571,height=97,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="common/button/dialog_btn_2_normal.png",file2="common/button/dialog_btn_2_press.png",
			{
				name="Text2",type=4,typeName="Text",time=112939840,x=0,y=0,width=200,height=150,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=40,textAlign=kAlignCenter,colorRed=240,colorGreen=230,colorBlue=210,string=[[立即参与]]
			}
		}
	}
}