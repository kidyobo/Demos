#ifndef MOF_CCNODELOADER_H
#define MOF_CCNODELOADER_H

class CCNodeLoader{
public:
	void onHandlePropTypeColor3(cocos2d::CCNode *,cocos2d::CCNode *,char const*,cocos2d::_ccColor3B,cocos2d::extension::CCBReader *);
	void onHandlePropTypeFloatVar(cocos2d::CCNode *,cocos2d::CCNode *,char const*,float *,cocos2d::extension::CCBReader *);
	void onHandlePropTypeBlockCCControl(cocos2d::CCNode *, cocos2d::CCNode *, char const*, cocos2d::extension::BlockCCControlData *,	cocos2d::extension::CCBReader *);
	void onHandlePropTypeScaleLock(cocos2d::CCNode *,cocos2d::CCNode	*,char const*,float *,cocos2d::extension::CCBReader *);
	void onHandlePropTypePosition(cocos2d::CCNode *,cocos2d::CCNode *,char const*,cocos2d::CCPoint,cocos2d::extension::CCBReader *);
	void onHandlePropTypeInteger(cocos2d::CCNode *, cocos2d::CCNode *, char const*, int, cocos2d::extension::CCBReader *);
	void parsePropTypeInteger(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void parsePropTypeBlock(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void parsePropTypeSize(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void parsePropTypeFloat(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void parsePropTypePointLock(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void parsePropTypeText(cocos2d::CCNode *,cocos2d::CCNode	*,cocos2d::extension::CCBReader	*);
	void onHandlePropTypePointLock(cocos2d::CCNode *, cocos2d::CCNode *, char const*, cocos2d::CCPoint, cocos2d::extension::CCBReader *);
	void onHandlePropTypeAnimation(cocos2d::CCNode *, cocos2d::CCNode *, char const*, cocos2d::CCAnimation *, cocos2d::extension::CCBReader *);
	void parsePropTypeAnimation(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void onHandlePropTypeFntFile(cocos2d::CCNode *, cocos2d::CCNode *, char const*, char const*, cocos2d::extension::CCBReader *);
	void onHandlePropTypeByte(cocos2d::CCNode *, cocos2d::CCNode *, char const*, unsigned char, cocos2d::extension::CCBReader *);
	void parsePropTypeFloat(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void onHandlePropTypeBlock(cocos2d::CCNode *,cocos2d::CCNode *,char const*,cocos2d::extension::BlockData	*,cocos2d::extension::CCBReader	*);
	void parsePropTypeBlendFunc(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void onHandlePropTypeSize(cocos2d::CCNode *,cocos2d::CCNode *,char const*,cocos2d::CCSize,cocos2d::extension::CCBReader *);
	void onHandlePropTypeColor3(cocos2d::CCNode *, cocos2d::CCNode *, char const*, cocos2d::_ccColor3B, cocos2d::extension::CCBReader *);
	void loader(void);
	void onHandlePropTypeString(cocos2d::CCNode *, cocos2d::CCNode *, char const*, char const*, cocos2d::extension::CCBReader *);
	void onHandlePropTypePointLock(cocos2d::CCNode *,cocos2d::CCNode	*,char const*,cocos2d::CCPoint,cocos2d::extension::CCBReader *);
	void parsePropTypeIntegerLabeled(cocos2d::CCNode	*,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void createCCNode(cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void loadCCNode(cocos2d::CCNode *, cocos2d::extension::CCBReader	*);
	void parsePropTypeString(cocos2d::CCNode	*,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void onHandlePropTypeFntFile(cocos2d::CCNode *,cocos2d::CCNode *,char const*,char const*,cocos2d::extension::CCBReader *);
	void onHandlePropTypeSpriteFrame(cocos2d::CCNode	*,cocos2d::CCNode *,char const*,cocos2d::CCSpriteFrame *,cocos2d::extension::CCBReader *);
	void onHandlePropTypeIntegerLabeled(cocos2d::CCNode *, cocos2d::CCNode *, char const*, int, cocos2d::extension::CCBReader *);
	void parsePropTypeText(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void parsePropTypeIntegerLabeled(cocos2d::CCNode	*, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void parsePropTypeSpriteFrame(cocos2d::CCNode *,	cocos2d::CCNode	*, cocos2d::extension::CCBReader *, char const*);
	void onHandlePropTypeFloatScale(cocos2d::CCNode *,cocos2d::CCNode *,char	const*,float,cocos2d::extension::CCBReader *);
	void onHandlePropTypeFlip(cocos2d::CCNode *,cocos2d::CCNode *,char const*,bool *,cocos2d::extension::CCBReader *);
	void onHandlePropTypePoint(cocos2d::CCNode *,cocos2d::CCNode *,char const*,cocos2d::CCPoint,cocos2d::extension::CCBReader *);
	void parsePropTypeTexture(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void parsePropTypeDegrees(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *,char const*);
	void parsePropTypeScaleLock(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *,char const*);
	void onHandlePropTypeScaleLock(cocos2d::CCNode *, cocos2d::CCNode *, char const*, float *, cocos2d::extension::CCBReader	*);
	void getCustomProperties(void);
	void onHandlePropTypeTexture(cocos2d::CCNode *, cocos2d::CCNode *, char const*, cocos2d::CCTexture2D *, cocos2d::extension::CCBReader *);
	void onHandlePropTypeString(cocos2d::CCNode *,cocos2d::CCNode *,char const*,char	const*,cocos2d::extension::CCBReader *);
	void onHandlePropTypeInteger(cocos2d::CCNode *,cocos2d::CCNode *,char const*,int,cocos2d::extension::CCBReader *);
	void parsePropTypeFontTTF(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void onHandlePropTypeDegrees(cocos2d::CCNode *,cocos2d::CCNode *,char const*,float,cocos2d::extension::CCBReader	*);
	void onHandlePropTypeAnimation(cocos2d::CCNode *,cocos2d::CCNode	*,char const*,cocos2d::CCAnimation *,cocos2d::extension::CCBReader *);
	void parsePropTypePoint(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void parsePropTypeString(cocos2d::CCNode	*, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void parsePropTypeBlock(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void parsePropTypeCCBFile(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void onHandlePropTypeColor4FVar(cocos2d::CCNode *,cocos2d::CCNode *,char	const*,cocos2d::_ccColor4F *,cocos2d::extension::CCBReader *);
	void parsePropTypeFntFile(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void onHandlePropTypeBlendFunc(cocos2d::CCNode *, cocos2d::CCNode *, char const*, cocos2d::_ccBlendFunc,	cocos2d::extension::CCBReader *);
	void onHandlePropTypeCheck(cocos2d::CCNode *, cocos2d::CCNode *,	char const*, bool, cocos2d::extension::CCBReader *);
	void parsePropTypeFntFile(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void parsePropTypePosition(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *,char const*);
	void onHandlePropTypeFloatScale(cocos2d::CCNode *, cocos2d::CCNode *, char const*, float, cocos2d::extension::CCBReader *);
	void parsePropTypeColor3(cocos2d::CCNode	*, cocos2d::CCNode *, cocos2d::extension::CCBReader *, char const*);
	void onHandlePropTypeFloat(cocos2d::CCNode *,cocos2d::CCNode *,char const*,float,cocos2d::extension::CCBReader *);
	void parsePropTypeBlendFunc(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void parsePropTypeSpriteFrame(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *,char const*);
	void loadCCNode(cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void parsePropTypeCheck(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *, char const*);
	void onHandlePropTypeCheck(cocos2d::CCNode *,cocos2d::CCNode *,char const*,bool,cocos2d::extension::CCBReader *);
	void onHandlePropTypeByte(cocos2d::CCNode *,cocos2d::CCNode *,char const*,uchar,cocos2d::extension::CCBReader *);
	void parsePropTypeCheck(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *,char	const*);
	void parsePropTypeColor4FVar(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void parsePropTypeColor4FVar(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader	*);
	void onHandlePropTypeSize(cocos2d::CCNode *, cocos2d::CCNode *, char const*, cocos2d::CCSize, cocos2d::extension::CCBReader *);
	void parsePropTypeInteger(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void parsePropTypeAnimation(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void parsePropTypeColor3(cocos2d::CCNode	*,cocos2d::CCNode *,cocos2d::extension::CCBReader *,char const*);
	void onHandlePropTypeFloatVar(cocos2d::CCNode *,	cocos2d::CCNode	*, char	const*,	float *, cocos2d::extension::CCBReader *);
	void parseProperties(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader	*);
	void onHandlePropTypeBlock(cocos2d::CCNode *, cocos2d::CCNode *,	char const*, cocos2d::extension::BlockData *, cocos2d::extension::CCBReader *);
	void ~CCNodeLoader();
	void onHandlePropTypeFloat(cocos2d::CCNode *, cocos2d::CCNode *,	char const*, float, cocos2d::extension::CCBReader *);
	void parsePropTypePointLock(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void onHandlePropTypeFontTTF(cocos2d::CCNode *, cocos2d::CCNode *, char const*, char const*, cocos2d::extension::CCBReader *);
	void onHandlePropTypeText(cocos2d::CCNode *,cocos2d::CCNode *,char const*,char const*,cocos2d::extension::CCBReader *);
	void parsePropTypeTexture(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void onHandlePropTypePoint(cocos2d::CCNode *, cocos2d::CCNode *,	char const*, cocos2d::CCPoint, cocos2d::extension::CCBReader *);
	void CCNodeLoader(void);
	void parsePropTypeFloatScale(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void onHandlePropTypeCCBFile(cocos2d::CCNode *, cocos2d::CCNode *, char const*, cocos2d::CCNode *, cocos2d::extension::CCBReader	*);
	void parsePropTypeFloatVar(cocos2d::CCNode *, cocos2d::CCNode *,	cocos2d::extension::CCBReader *);
	void parsePropTypeCCBFile(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void onHandlePropTypeBlendFunc(cocos2d::CCNode *,cocos2d::CCNode	*,char const*,cocos2d::_ccBlendFunc,cocos2d::extension::CCBReader *);
	void parsePropTypeDegrees(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *,	char const*);
	void parsePropTypeBlockCCControl(cocos2d::CCNode	*, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void parsePropTypeByte(cocos2d::CCNode *,cocos2d::CCNode	*,cocos2d::extension::CCBReader	*,char const*);
	void onHandlePropTypeCCBFile(cocos2d::CCNode *,cocos2d::CCNode *,char const*,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void onHandlePropTypeTexture(cocos2d::CCNode *,cocos2d::CCNode *,char const*,cocos2d::CCTexture2D *,cocos2d::extension::CCBReader *);
	void parsePropTypeSize(cocos2d::CCNode *,cocos2d::CCNode	*,cocos2d::extension::CCBReader	*);
	void parseProperties(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void parsePropTypeFlip(cocos2d::CCNode *,cocos2d::CCNode	*,cocos2d::extension::CCBReader	*);
	void parsePropTypeByte(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *, char const*);
	void parsePropTypeFlip(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *);
	void parsePropTypeFloatScale(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader	*);
	void parsePropTypePosition(cocos2d::CCNode *, cocos2d::CCNode *,	cocos2d::extension::CCBReader *, char const*);
	void onHandlePropTypeBlockCCControl(cocos2d::CCNode *,cocos2d::CCNode *,char const*,cocos2d::extension::BlockCCControlData *,cocos2d::extension::CCBReader *);
	void onHandlePropTypeIntegerLabeled(cocos2d::CCNode *,cocos2d::CCNode *,char const*,int,cocos2d::extension::CCBReader *);
	void onHandlePropTypeColor4FVar(cocos2d::CCNode *, cocos2d::CCNode *, char const*, cocos2d::_ccColor4F *, cocos2d::extension::CCBReader *);
	void parsePropTypeScaleLock(cocos2d::CCNode *, cocos2d::CCNode *, cocos2d::extension::CCBReader *, char const*);
	void onHandlePropTypeSpriteFrame(cocos2d::CCNode	*, cocos2d::CCNode *, char const*, cocos2d::CCSpriteFrame *, cocos2d::extension::CCBReader *);
	void parsePropTypeBlockCCControl(cocos2d::CCNode	*,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void onHandlePropTypeFontTTF(cocos2d::CCNode *,cocos2d::CCNode *,char const*,char const*,cocos2d::extension::CCBReader *);
	void onHandlePropTypeDegrees(float);
	void parsePropTypeFloatVar(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void onHandlePropTypeText(cocos2d::CCNode *, cocos2d::CCNode *, char const*, char const*, cocos2d::extension::CCBReader *);
	void parsePropTypeFontTTF(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void parsePropTypePoint(cocos2d::CCNode *,cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void createCCNode(cocos2d::CCNode *,cocos2d::extension::CCBReader *);
	void onHandlePropTypeFlip(cocos2d::CCNode *, cocos2d::CCNode *, char const*, bool *, cocos2d::extension::CCBReader *);
	void onHandlePropTypePosition(cocos2d::CCNode *,	cocos2d::CCNode	*, char	const*,	cocos2d::CCPoint, cocos2d::extension::CCBReader	*);
}
#endif