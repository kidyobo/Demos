#ifndef MOF_CCLABELBMFONTLOADER_H
#define MOF_CCLABELBMFONTLOADER_H

class CCLabelBMFontLoader{
public:
	void onHandlePropTypeByte(cocos2d::CCNode	*, cocos2d::CCNode *, char const*, unsigned char, cocos2d::extension::CCBReader	*);
	void onHandlePropTypeByte(cocos2d::CCNode	*,cocos2d::CCNode *,char const*,uchar,cocos2d::extension::CCBReader *);
	void createCCNode(cocos2d::CCNode	*,cocos2d::extension::CCBReader	*);
	void onHandlePropTypeBlendFunc(cocos2d::CCNode *,cocos2d::CCNode *,char const*,cocos2d::_ccBlendFunc,cocos2d::extension::CCBReader *);
	void onHandlePropTypeColor3(cocos2d::CCNode *,cocos2d::CCNode *,char const*,cocos2d::_ccColor3B,cocos2d::extension::CCBReader *);
	void onHandlePropTypeText(cocos2d::CCNode	*, cocos2d::CCNode *, char const*, char	const*,	cocos2d::extension::CCBReader *);
	void onHandlePropTypeBlendFunc(cocos2d::CCNode *,	cocos2d::CCNode	*, char	const*,	cocos2d::_ccBlendFunc, cocos2d::extension::CCBReader *);
	void onHandlePropTypeText(cocos2d::CCNode	*,cocos2d::CCNode *,char const*,char const*,cocos2d::extension::CCBReader *);
	void loader(void);
	void ~CCLabelBMFontLoader();
	void createCCNode(cocos2d::CCNode	*, cocos2d::extension::CCBReader *);
	void onHandlePropTypeFntFile(cocos2d::CCNode *,cocos2d::CCNode *,char const*,char	const*,cocos2d::extension::CCBReader *);
	void onHandlePropTypeFntFile(cocos2d::CCNode *, cocos2d::CCNode *, char const*, char const*, cocos2d::extension::CCBReader *);
}
#endif