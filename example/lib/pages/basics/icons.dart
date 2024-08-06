import 'package:colorui/colorui.dart';
import 'package:example/widget.dart';
import 'package:flutter/material.dart';

List<Map<String, dynamic>> kIcons = [
  {"name": "aa", "icon": CuIcons.aa},
  {"name": "accounts", "icon": CuIcons.accounts},
  {"name": "accountsO", "icon": CuIcons.accountsO},
  {"name": "add", "icon": CuIcons.add},
  {"name": "addRound", "icon": CuIcons.addRound},
  {"name": "addRoundO", "icon": CuIcons.addRoundO},
  {"name": "alarm", "icon": CuIcons.alarm},
  {"name": "album", "icon": CuIcons.album},
  {"name": "alipay", "icon": CuIcons.alipay},
  {"name": "android", "icon": CuIcons.android},
  {"name": "angle", "icon": CuIcons.angle},
  {"name": "apple", "icon": CuIcons.apple},
  {"name": "apps", "icon": CuIcons.apps},
  {"name": "archive", "icon": CuIcons.archive},
  {"name": "archiveO", "icon": CuIcons.archiveO},
  {"name": "arrow", "icon": CuIcons.arrow},
  {"name": "atLine", "icon": CuIcons.atLine},
  {"name": "avatar", "icon": CuIcons.avatar},
  {"name": "avatarO", "icon": CuIcons.avatarO},
  {"name": "avatars", "icon": CuIcons.avatars},
  {"name": "avatarsO", "icon": CuIcons.avatarsO},
  {"name": "back", "icon": CuIcons.back},
  {"name": "backspace", "icon": CuIcons.backspace},
  {"name": "backup", "icon": CuIcons.backup},
  {"name": "backupRestore", "icon": CuIcons.backupRestore},
  {"name": "barcode", "icon": CuIcons.barcode},
  {"name": "book", "icon": CuIcons.book},
  {"name": "bookmark", "icon": CuIcons.bookmark},
  {"name": "bookmarkO", "icon": CuIcons.bookmarkO},
  {"name": "bookmarks", "icon": CuIcons.bookmarks},
  {"name": "box", "icon": CuIcons.box},
  {"name": "boxBlock", "icon": CuIcons.boxBlock},
  {"name": "boxRight", "icon": CuIcons.boxRight},
  {"name": "brand", "icon": CuIcons.brand},
  {"name": "brandO", "icon": CuIcons.brandO},
  {"name": "building", "icon": CuIcons.building},
  {"name": "buildingO", "icon": CuIcons.buildingO},
  {"name": "camera", "icon": CuIcons.camera},
  {"name": "cameraAdd", "icon": CuIcons.cameraAdd},
  {"name": "cameraAddO", "icon": CuIcons.cameraAddO},
  {"name": "cameraLens", "icon": CuIcons.cameraLens},
  {"name": "cameraLensO", "icon": CuIcons.cameraLensO},
  {"name": "cameraO", "icon": CuIcons.cameraO},
  {"name": "cameraRotate", "icon": CuIcons.cameraRotate},
  {"name": "card", "icon": CuIcons.card},
  {"name": "cardboard", "icon": CuIcons.cardboard},
  {"name": "cardboardO", "icon": CuIcons.cardboardO},
  {"name": "cardboardOffO", "icon": CuIcons.cardboardOffO},
  {"name": "cart", "icon": CuIcons.cart},
  {"name": "cartO", "icon": CuIcons.cartO},
  {"name": "chat", "icon": CuIcons.chat},
  {"name": "chatBubble", "icon": CuIcons.chatBubble},
  {"name": "chatBubbleO", "icon": CuIcons.chatBubbleO},
  {"name": "chatList", "icon": CuIcons.chatList},
  {"name": "chatListO", "icon": CuIcons.chatListO},
  {"name": "chatO", "icon": CuIcons.chatO},
  {"name": "chatSmile", "icon": CuIcons.chatSmile},
  {"name": "chatSmileO", "icon": CuIcons.chatSmileO},
  {"name": "chatSmiles", "icon": CuIcons.chatSmiles},
  {"name": "chatSmilesO", "icon": CuIcons.chatSmilesO},
  {"name": "check", "icon": CuIcons.check},
  {"name": "checkbox", "icon": CuIcons.checkbox},
  {"name": "checkboxO", "icon": CuIcons.checkboxO},
  {"name": "checkRound", "icon": CuIcons.checkRound},
  {"name": "checkRoundO", "icon": CuIcons.checkRoundO},
  {"name": "choiceness", "icon": CuIcons.choiceness},
  {"name": "choicenessO", "icon": CuIcons.choicenessO},
  {"name": "chrome", "icon": CuIcons.chrome},
  {"name": "circle", "icon": CuIcons.circle},
  {"name": "circleO", "icon": CuIcons.circleO},
  {"name": "close", "icon": CuIcons.close},
  {"name": "closeRound", "icon": CuIcons.closeRound},
  {"name": "closeRoundO", "icon": CuIcons.closeRoundO},
  {"name": "clothes", "icon": CuIcons.clothes},
  {"name": "clothesO", "icon": CuIcons.clothesO},
  {"name": "cloud", "icon": CuIcons.cloud},
  {"name": "cloudDone", "icon": CuIcons.cloudDone},
  {"name": "cloudDownload", "icon": CuIcons.cloudDownload},
  {"name": "cloudO", "icon": CuIcons.cloudO},
  {"name": "cloudOff", "icon": CuIcons.cloudOff},
  {"name": "cloudUpload", "icon": CuIcons.cloudUpload},
  {"name": "codeBox", "icon": CuIcons.codeBox},
  {"name": "coin", "icon": CuIcons.coin},
  {"name": "coinO", "icon": CuIcons.coinO},
  {"name": "comment", "icon": CuIcons.comment},
  {"name": "commentO", "icon": CuIcons.commentO},
  {"name": "community", "icon": CuIcons.community},
  {"name": "communityO", "icon": CuIcons.communityO},
  {"name": "countdown", "icon": CuIcons.countdown},
  {"name": "countdownO", "icon": CuIcons.countdownO},
  {"name": "creative", "icon": CuIcons.creative},
  {"name": "creativeO", "icon": CuIcons.creativeO},
  {"name": "crop", "icon": CuIcons.crop},
  {"name": "crown", "icon": CuIcons.crown},
  {"name": "crownO", "icon": CuIcons.crownO},
  {"name": "cut", "icon": CuIcons.cut},
  {"name": "darkmode", "icon": CuIcons.darkmode},
  {"name": "dashboard", "icon": CuIcons.dashboard},
  {"name": "delete", "icon": CuIcons.delete},
  {"name": "deleteClose", "icon": CuIcons.deleteClose},
  {"name": "deleteLine", "icon": CuIcons.deleteLine},
  {"name": "deleteLineO", "icon": CuIcons.deleteLineO},
  {"name": "deleteO", "icon": CuIcons.deleteO},
  {"name": "deliver", "icon": CuIcons.deliver},
  {"name": "deliverO", "icon": CuIcons.deliverO},
  {"name": "demo", "icon": CuIcons.demo},
  {"name": "discover", "icon": CuIcons.discover},
  {"name": "discoverO", "icon": CuIcons.discoverO},
  {"name": "discussFill", "icon": CuIcons.discussFill},
  {"name": "discussLine", "icon": CuIcons.discussLine},
  {"name": "dollar", "icon": CuIcons.dollar},
  {"name": "dollarO", "icon": CuIcons.dollarO},
  {"name": "done", "icon": CuIcons.done},
  {"name": "doneAll", "icon": CuIcons.doneAll},
  {"name": "douyin", "icon": CuIcons.douyin},
  {"name": "dropDown", "icon": CuIcons.dropDown},
  {"name": "dropUp", "icon": CuIcons.dropUp},
  {"name": "eject", "icon": CuIcons.eject},
  {"name": "ellipse", "icon": CuIcons.ellipse},
  {"name": "emoji", "icon": CuIcons.emoji},
  {"name": "emojiO", "icon": CuIcons.emojiO},
  {"name": "equalizer", "icon": CuIcons.equalizer},
  {"name": "eraser", "icon": CuIcons.eraser},
  {"name": "eraserO", "icon": CuIcons.eraserO},
  {"name": "evaluate", "icon": CuIcons.evaluate},
  {"name": "evaluateO", "icon": CuIcons.evaluateO},
  {"name": "eventClose", "icon": CuIcons.eventClose},
  {"name": "eventDone", "icon": CuIcons.eventDone},
  {"name": "eventList", "icon": CuIcons.eventList},
  {"name": "explore", "icon": CuIcons.explore},
  {"name": "exploreLine", "icon": CuIcons.exploreLine},
  {"name": "exploreLineO", "icon": CuIcons.exploreLineO},
  {"name": "exploreO", "icon": CuIcons.exploreO},
  {"name": "extension", "icon": CuIcons.extension},
  {"name": "extensionO", "icon": CuIcons.extensionO},
  {"name": "eye", "icon": CuIcons.eye},
  {"name": "eyeFavor", "icon": CuIcons.eyeFavor},
  {"name": "eyeFavorO", "icon": CuIcons.eyeFavorO},
  {"name": "eyeO", "icon": CuIcons.eyeO},
  {"name": "eyeOff", "icon": CuIcons.eyeOff},
  {"name": "eyeOffO", "icon": CuIcons.eyeOffO},
  {"name": "facebook", "icon": CuIcons.facebook},
  {"name": "favorite", "icon": CuIcons.favorite},
  {"name": "favoriteO", "icon": CuIcons.favoriteO},
  {"name": "female", "icon": CuIcons.female},
  {"name": "file", "icon": CuIcons.file},
  {"name": "fileCopy", "icon": CuIcons.fileCopy},
  {"name": "fileCopyO", "icon": CuIcons.fileCopyO},
  {"name": "fileO", "icon": CuIcons.fileO},
  {"name": "fileText", "icon": CuIcons.fileText},
  {"name": "fileTextO", "icon": CuIcons.fileTextO},
  {"name": "filter", "icon": CuIcons.filter},
  {"name": "fingerprint", "icon": CuIcons.fingerprint},
  {"name": "firstPage", "icon": CuIcons.firstPage},
  {"name": "flag", "icon": CuIcons.flag},
  {"name": "flagO", "icon": CuIcons.flagO},
  {"name": "flashClose", "icon": CuIcons.flashClose},
  {"name": "flashOff", "icon": CuIcons.flashOff},
  {"name": "flashOn", "icon": CuIcons.flashOn},
  {"name": "flashOpen", "icon": CuIcons.flashOpen},
  {"name": "folder", "icon": CuIcons.folder},
  {"name": "folderAdd", "icon": CuIcons.folderAdd},
  {"name": "folderO", "icon": CuIcons.folderO},
  {"name": "folderSpecial", "icon": CuIcons.folderSpecial},
  {"name": "forward", "icon": CuIcons.forward},
  {"name": "fullscreen", "icon": CuIcons.fullscreen},
  {"name": "fullscreenExit", "icon": CuIcons.fullscreenExit},
  {"name": "game", "icon": CuIcons.game},
  {"name": "gameO", "icon": CuIcons.gameO},
  {"name": "gitCommit", "icon": CuIcons.gitCommit},
  {"name": "gitCommitO", "icon": CuIcons.gitCommitO},
  {"name": "github", "icon": CuIcons.github},
  {"name": "githubCircle", "icon": CuIcons.githubCircle},
  {"name": "goods", "icon": CuIcons.goods},
  {"name": "goodsnew", "icon": CuIcons.goodsnew},
  {"name": "goodsnewO", "icon": CuIcons.goodsnewO},
  {"name": "goodsO", "icon": CuIcons.goodsO},
  {"name": "googleplaylogo", "icon": CuIcons.googleplaylogo},
  {"name": "grid", "icon": CuIcons.grid},
  {"name": "gridO", "icon": CuIcons.gridO},
  {"name": "group", "icon": CuIcons.group},
  {"name": "groupO", "icon": CuIcons.groupO},
  {"name": "guanli", "icon": CuIcons.guanli},
  {"name": "headset", "icon": CuIcons.headset},
  {"name": "headsetMic", "icon": CuIcons.headsetMic},
  {"name": "help", "icon": CuIcons.help},
  {"name": "helpO", "icon": CuIcons.helpO},
  {"name": "home", "icon": CuIcons.home},
  {"name": "home2", "icon": CuIcons.home2},
  {"name": "home2O", "icon": CuIcons.home2O},
  {"name": "home3", "icon": CuIcons.home3},
  {"name": "home3O", "icon": CuIcons.home3O},
  {"name": "home4", "icon": CuIcons.home4},
  {"name": "home4O", "icon": CuIcons.home4O},
  {"name": "homeCommunity", "icon": CuIcons.homeCommunity},
  {"name": "homeDot", "icon": CuIcons.homeDot},
  {"name": "homeDotO", "icon": CuIcons.homeDotO},
  {"name": "homeLine", "icon": CuIcons.homeLine},
  {"name": "homeLineO", "icon": CuIcons.homeLineO},
  {"name": "homeO", "icon": CuIcons.homeO},
  {"name": "homeSm", "icon": CuIcons.homeSm},
  {"name": "homeSmile", "icon": CuIcons.homeSmile},
  {"name": "homeSmileO", "icon": CuIcons.homeSmileO},
  {"name": "homeSmline", "icon": CuIcons.homeSmline},
  {"name": "homeSmlineO", "icon": CuIcons.homeSmlineO},
  {"name": "homeSmO", "icon": CuIcons.homeSmO},
  {"name": "hotel", "icon": CuIcons.hotel},
  {"name": "hotelO", "icon": CuIcons.hotelO},
  {"name": "huohu", "icon": CuIcons.huohu},
  {"name": "ie", "icon": CuIcons.ie},
  {"name": "imageText", "icon": CuIcons.imageText},
  {"name": "imageTextO", "icon": CuIcons.imageTextO},
  {"name": "importExport", "icon": CuIcons.importExport},
  {"name": "info", "icon": CuIcons.info},
  {"name": "infoO", "icon": CuIcons.infoO},
  {"name": "input", "icon": CuIcons.input},
  {"name": "inputO", "icon": CuIcons.inputO},
  {"name": "keyboard", "icon": CuIcons.keyboard},
  {"name": "kinds", "icon": CuIcons.kinds},
  {"name": "lastPage", "icon": CuIcons.lastPage},
  {"name": "layout", "icon": CuIcons.layout},
  {"name": "layoutO", "icon": CuIcons.layoutO},
  {"name": "lightmode", "icon": CuIcons.lightmode},
  {"name": "link", "icon": CuIcons.link},
  {"name": "linkOff", "icon": CuIcons.linkOff},
  {"name": "loaderFill", "icon": CuIcons.loaderFill},
  {"name": "loading", "icon": CuIcons.loading},
  {"name": "loading1", "icon": CuIcons.loading1},
  {"name": "loading2", "icon": CuIcons.loading2},
  {"name": "locationOff", "icon": CuIcons.locationOff},
  {"name": "locationOffO", "icon": CuIcons.locationOffO},
  {"name": "locationOn", "icon": CuIcons.locationOn},
  {"name": "locationOnO", "icon": CuIcons.locationOnO},
  {"name": "lock", "icon": CuIcons.lock},
  {"name": "lockO", "icon": CuIcons.lockO},
  {"name": "lockOpen", "icon": CuIcons.lockOpen},
  {"name": "logout", "icon": CuIcons.logout},
  {"name": "loop", "icon": CuIcons.loop},
  {"name": "magic", "icon": CuIcons.magic},
  {"name": "magicO", "icon": CuIcons.magicO},
  {"name": "mail", "icon": CuIcons.mail},
  {"name": "mailO", "icon": CuIcons.mailO},
  {"name": "male", "icon": CuIcons.male},
  {"name": "mic", "icon": CuIcons.mic},
  {"name": "micNone", "icon": CuIcons.micNone},
  {"name": "micOff", "icon": CuIcons.micOff},
  {"name": "miniprogram", "icon": CuIcons.miniprogram},
  {"name": "mobile", "icon": CuIcons.mobile},
  {"name": "mobileO", "icon": CuIcons.mobileO},
  {"name": "moneybag", "icon": CuIcons.moneybag},
  {"name": "moneybagO", "icon": CuIcons.moneybagO},
  {"name": "more", "icon": CuIcons.more},
  {"name": "moreTag", "icon": CuIcons.moreTag},
  {"name": "move", "icon": CuIcons.move},
  {"name": "moveRound", "icon": CuIcons.moveRound},
  {"name": "moveRoundO", "icon": CuIcons.moveRoundO},
  {"name": "music", "icon": CuIcons.music},
  {"name": "musicOff", "icon": CuIcons.musicOff},
  {"name": "my", "icon": CuIcons.my},
  {"name": "myO", "icon": CuIcons.myO},
  {"name": "nearMe", "icon": CuIcons.nearMe},
  {"name": "nearMeO", "icon": CuIcons.nearMeO},
  {"name": "not", "icon": CuIcons.not},
  {"name": "notice", "icon": CuIcons.notice},
  {"name": "noticeActive", "icon": CuIcons.noticeActive},
  {"name": "noticeActiveO", "icon": CuIcons.noticeActiveO},
  {"name": "noticeO", "icon": CuIcons.noticeO},
  {"name": "noticeOff", "icon": CuIcons.noticeOff},
  {"name": "noticeOffO", "icon": CuIcons.noticeOffO},
  {"name": "numcode", "icon": CuIcons.numcode},
  {"name": "order", "icon": CuIcons.order},
  {"name": "orderO", "icon": CuIcons.orderO},
  {"name": "paint", "icon": CuIcons.paint},
  {"name": "paintO", "icon": CuIcons.paintO},
  {"name": "palette", "icon": CuIcons.palette},
  {"name": "paletteO", "icon": CuIcons.paletteO},
  {"name": "pause", "icon": CuIcons.pause},
  {"name": "pauseCircle", "icon": CuIcons.pauseCircle},
  {"name": "person", "icon": CuIcons.person},
  {"name": "personAdd", "icon": CuIcons.personAdd},
  {"name": "personAddO", "icon": CuIcons.personAddO},
  {"name": "personO", "icon": CuIcons.personO},
  {"name": "personPinCircle", "icon": CuIcons.personPinCircle},
  {"name": "personPinCircleO", "icon": CuIcons.personPinCircleO},
  {"name": "phone", "icon": CuIcons.phone},
  {"name": "phoneCall", "icon": CuIcons.phoneCall},
  {"name": "pic", "icon": CuIcons.pic},
  {"name": "picO", "icon": CuIcons.picO},
  {"name": "pinDrop", "icon": CuIcons.pinDrop},
  {"name": "pinDropO", "icon": CuIcons.pinDropO},
  {"name": "place", "icon": CuIcons.place},
  {"name": "placeO", "icon": CuIcons.placeO},
  {"name": "playArrow", "icon": CuIcons.playArrow},
  {"name": "playCircle", "icon": CuIcons.playCircle},
  {"name": "playCircleO", "icon": CuIcons.playCircleO},
  {"name": "popover", "icon": CuIcons.popover},
  {"name": "popoverO", "icon": CuIcons.popoverO},
  {"name": "present", "icon": CuIcons.present},
  {"name": "presentO", "icon": CuIcons.presentO},
  {"name": "progress", "icon": CuIcons.progress},
  {"name": "qq", "icon": CuIcons.qq},
  {"name": "qrCodeFill", "icon": CuIcons.qrCodeFill},
  {"name": "qrCodeLine", "icon": CuIcons.qrCodeLine},
  {"name": "quill", "icon": CuIcons.quill},
  {"name": "quillO", "icon": CuIcons.quillO},
  {"name": "radio", "icon": CuIcons.radio},
  {"name": "radiobox", "icon": CuIcons.radiobox},
  {"name": "radioboxO", "icon": CuIcons.radioboxO},
  {"name": "recharge", "icon": CuIcons.recharge},
  {"name": "rechargeO", "icon": CuIcons.rechargeO},
  {"name": "record", "icon": CuIcons.record},
  {"name": "recordO", "icon": CuIcons.recordO},
  {"name": "redo", "icon": CuIcons.redo},
  {"name": "redpacket", "icon": CuIcons.redpacket},
  {"name": "redpacketO", "icon": CuIcons.redpacketO},
  {"name": "refresh", "icon": CuIcons.refresh},
  {"name": "repair", "icon": CuIcons.repair},
  {"name": "repairO", "icon": CuIcons.repairO},
  {"name": "repeat", "icon": CuIcons.repeat},
  {"name": "replay", "icon": CuIcons.replay},
  {"name": "reply", "icon": CuIcons.reply},
  {"name": "replyAll", "icon": CuIcons.replyAll},
  {"name": "roadMap", "icon": CuIcons.roadMap},
  {"name": "roadMapO", "icon": CuIcons.roadMapO},
  {"name": "round", "icon": CuIcons.round},
  {"name": "roundAngle", "icon": CuIcons.roundAngle},
  {"name": "roundAngleO", "icon": CuIcons.roundAngleO},
  {"name": "roundArrowLine", "icon": CuIcons.roundArrowLine},
  {"name": "roundBox", "icon": CuIcons.roundBox},
  {"name": "safe", "icon": CuIcons.safe},
  {"name": "safeCheck", "icon": CuIcons.safeCheck},
  {"name": "safeCheckO", "icon": CuIcons.safeCheckO},
  {"name": "safeFlash", "icon": CuIcons.safeFlash},
  {"name": "safeFlashO", "icon": CuIcons.safeFlashO},
  {"name": "safeKey", "icon": CuIcons.safeKey},
  {"name": "safeKeyO", "icon": CuIcons.safeKeyO},
  {"name": "safeO", "icon": CuIcons.safeO},
  {"name": "save", "icon": CuIcons.save},
  {"name": "saveO", "icon": CuIcons.saveO},
  {"name": "scan", "icon": CuIcons.scan},
  {"name": "scissors", "icon": CuIcons.scissors},
  {"name": "search", "icon": CuIcons.search},
  {"name": "searchLine", "icon": CuIcons.searchLine},
  {"name": "searchlist", "icon": CuIcons.searchlist},
  {"name": "searchO", "icon": CuIcons.searchO},
  {"name": "searchSm", "icon": CuIcons.searchSm},
  {"name": "service", "icon": CuIcons.service},
  {"name": "serviceFill", "icon": CuIcons.serviceFill},
  {"name": "serviceO", "icon": CuIcons.serviceO},
  {"name": "set", "icon": CuIcons.set},
  {"name": "setList", "icon": CuIcons.setList},
  {"name": "setO", "icon": CuIcons.setO},
  {"name": "settings", "icon": CuIcons.settings},
  {"name": "settingsO", "icon": CuIcons.settingsO},
  {"name": "share", "icon": CuIcons.share},
  {"name": "shareLineO", "icon": CuIcons.shareLineO},
  {"name": "shengji", "icon": CuIcons.shengji},
  {"name": "shoppingCart", "icon": CuIcons.shoppingCart},
  {"name": "shoppingCartO", "icon": CuIcons.shoppingCartO},
  {"name": "show", "icon": CuIcons.show},
  {"name": "showO", "icon": CuIcons.showO},
  {"name": "shuffle", "icon": CuIcons.shuffle},
  {"name": "sip", "icon": CuIcons.sip},
  {"name": "sipO", "icon": CuIcons.sipO},
  {"name": "skipNext", "icon": CuIcons.skipNext},
  {"name": "skipPrevious", "icon": CuIcons.skipPrevious},
  {"name": "slack", "icon": CuIcons.slack},
  {"name": "slackSquare", "icon": CuIcons.slackSquare},
  {"name": "sort", "icon": CuIcons.sort},
  {"name": "sortOrder", "icon": CuIcons.sortOrder},
  {"name": "sound", "icon": CuIcons.sound},
  {"name": "sponsor", "icon": CuIcons.sponsor},
  {"name": "sponsorO", "icon": CuIcons.sponsorO},
  {"name": "star", "icon": CuIcons.star},
  {"name": "starHalf", "icon": CuIcons.starHalf},
  {"name": "starO", "icon": CuIcons.starO},
  {"name": "stock", "icon": CuIcons.stock},
  {"name": "stop", "icon": CuIcons.stop},
  {"name": "store", "icon": CuIcons.store},
  {"name": "store0", "icon": CuIcons.store0},
  {"name": "store2", "icon": CuIcons.store2},
  {"name": "store2O", "icon": CuIcons.store2O},
  {"name": "subLeft", "icon": CuIcons.subLeft},
  {"name": "subRight", "icon": CuIcons.subRight},
  {"name": "subtitles", "icon": CuIcons.subtitles},
  {"name": "subtitlesO", "icon": CuIcons.subtitlesO},
  {"name": "syncAlt", "icon": CuIcons.syncAlt},
  {"name": "tag", "icon": CuIcons.tag},
  {"name": "tagO", "icon": CuIcons.tagO},
  {"name": "taobao", "icon": CuIcons.taobao},
  {"name": "terminal", "icon": CuIcons.terminal},
  {"name": "terminalO", "icon": CuIcons.terminalO},
  {"name": "thumbDown", "icon": CuIcons.thumbDown},
  {"name": "thumbDownO", "icon": CuIcons.thumbDownO},
  {"name": "thumbUp", "icon": CuIcons.thumbUp},
  {"name": "thumbUpLine", "icon": CuIcons.thumbUpLine},
  {"name": "thumbUpLineO", "icon": CuIcons.thumbUpLineO},
  {"name": "thumbUpO", "icon": CuIcons.thumbUpO},
  {"name": "ticket", "icon": CuIcons.ticket},
  {"name": "ticketO", "icon": CuIcons.ticketO},
  {"name": "time", "icon": CuIcons.time},
  {"name": "timeO", "icon": CuIcons.timeO},
  {"name": "timer", "icon": CuIcons.timer},
  {"name": "title", "icon": CuIcons.title},
  {"name": "titles", "icon": CuIcons.titles},
  {"name": "toggle", "icon": CuIcons.toggle},
  {"name": "toggleO", "icon": CuIcons.toggleO},
  {"name": "topbar", "icon": CuIcons.topbar},
  {"name": "translate", "icon": CuIcons.translate},
  {"name": "tree", "icon": CuIcons.tree},
  {"name": "tt", "icon": CuIcons.tt},
  {"name": "twiter", "icon": CuIcons.twiter},
  {"name": "ciconCommunityO", "icon": CuIcons.ciconCommunityO},
  {"name": "undo", "icon": CuIcons.undo},
  {"name": "unfoldLess", "icon": CuIcons.unfoldLess},
  {"name": "unfoldMore", "icon": CuIcons.unfoldMore},
  {"name": "upstage", "icon": CuIcons.upstage},
  {"name": "upstageO", "icon": CuIcons.upstageO},
  {"name": "viewAgenda", "icon": CuIcons.viewAgenda},
  {"name": "viewArray", "icon": CuIcons.viewArray},
  {"name": "viewCarousel", "icon": CuIcons.viewCarousel},
  {"name": "viewColumn", "icon": CuIcons.viewColumn},
  {"name": "viewDay", "icon": CuIcons.viewDay},
  {"name": "viewHeadline", "icon": CuIcons.viewHeadline},
  {"name": "viewList", "icon": CuIcons.viewList},
  {"name": "viewModule", "icon": CuIcons.viewModule},
  {"name": "viewQuilt", "icon": CuIcons.viewQuilt},
  {"name": "volume", "icon": CuIcons.volume},
  {"name": "volumeOff", "icon": CuIcons.volumeOff},
  {"name": "warn", "icon": CuIcons.warn},
  {"name": "warnO", "icon": CuIcons.warnO},
  {"name": "wechatPay", "icon": CuIcons.wechatPay},
  {"name": "weiboFill", "icon": CuIcons.weiboFill},
  {"name": "weiboO", "icon": CuIcons.weiboO},
  {"name": "weixin", "icon": CuIcons.weixin},
  {"name": "whatshot", "icon": CuIcons.whatshot},
  {"name": "whatshotO", "icon": CuIcons.whatshotO},
  {"name": "wifi", "icon": CuIcons.wifi},
  {"name": "wifiOff", "icon": CuIcons.wifiOff},
  {"name": "yamaxun", "icon": CuIcons.yamaxun},
  {"name": "zuoji", "icon": CuIcons.zuoji},
];

class IconsPage extends StatefulWidget {
  const IconsPage({super.key});

  @override
  State<IconsPage> createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> {
  Widget buildIcon() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: CuColors.grey),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(CuIcons.home),
            Text(
              "home",
              style: const TextStyle().$sm.$gray,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return UIMainLayout(
      child: Scaffold(
        appBar: const CuNavbar(titleText: "图标"),
        body: Padding(
          padding: 12.$edgeAll,
          child: Column(
            children: [
              CuAction.text("图标列表(${kIcons.length})"),
              hSpacing,
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 6,
                    children: kIcons.map((item) {
                      String name = item["name"];
                      IconData icon = item["icon"];
                      return Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: CuColors.white,
                          borderRadius: 12.$radiusCircle,
                          border: Border.all(
                            color: CuColors.grey.withOpacity(.24),
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(icon),
                              9.hSpace,
                              Text(name, style: const TextStyle().$sm.$gray),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              12.hSpace,
            ],
          ),
        ),
      ),
    );
  }
}
