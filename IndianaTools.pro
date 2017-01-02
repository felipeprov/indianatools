#-------------------------------------------------
#
# Project created by QtCreator 2017-01-02T10:04:19
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets


QT += opengl
TARGET = IndianaTools
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


SOURCES += main.cpp\
        mainwindow.cpp \
    moaiwidget.cpp \
    ../../vs2015/host-modules/aku_modules.cpp \
    ../../vs2015/host-modules/aku_modules_util.cpp

HEADERS  += mainwindow.h \
    moaiwidget.h \
    ../../vs2015/host-modules/aku_modules.h \
    ../../vs2015/host-modules/aku_modules_config.h \
    ../../vs2015/host-modules/aku_modules_util.h \
    ../../vs2015/host-modules/aku_plugins.cpp.in \
    ../../vs2015/host-modules/aku_plugins.h

FORMS    += mainwindow.ui

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../vs2015/lib/release/ -lmoai-lib-core
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../vs2015/lib/debug/ -lmoai-lib-core

INCLUDEPATH += $$PWD/../../vs2015/sdk/src/moai-core
DEPENDPATH += $$PWD/../../vs2015/sdk/src/moai-core

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../vs2015/lib/release/libmoai-lib-core.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../vs2015/lib/debug/libmoai-lib-core.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../vs2015/lib/release/moai-lib-core.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../vs2015/lib/debug/moai-lib-core.lib

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../vs2015/lib/release/ -llua-lib-5.1
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../vs2015/lib/debug/ -llua-lib-5.1

INCLUDEPATH += $$PWD/../../sdk/3dparty/lua
DEPENDPATH += $$PWD/../../sdk/3dparty/lua

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../vs2015/lib/release/liblua-lib-5.1.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../vs2015/lib/debug/liblua-lib-5.1.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../vs2015/lib/release/lua-lib-5.1.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../vs2015/lib/debug/lua-lib-5.1.lib

INCLUDEPATH += $$PWD/../../vs2015
INCLUDEPATH += $$PWD/../../vs2015/host-sdl
DEPENDPATH += $$PWD/../../vs2015

INCLUDEPATH += $$PWD/../../vs2015/sdk/src
DEPENDPATH += $$PWD/../../vs2015/sdk/src

DEFINES += DEBUG CURL_STATICLIB WIN32 _DEBUG _CONSOLE

LIBS += opengl32.lib \
        moai-lib-core.lib  \
        box2d.lib \
        contrib.lib \
        moai-lib-sim.lib \
        moai-lib-box2d.lib \
        moai-lib-crypto.lib \
        zl-lib-crypto.lib \
        moai-lib-http-client.lib \
        moai-lib-http-server.lib \
        moai-lib-image-png.lib \
        moai-lib-image-jpg.lib \
        moai-lib-image-pvr.lib \
        moai-lib-image-webp.lib \
        moai-lib-luaext.lib \
        moai-lib-util.lib \
        moai-lib-untz.lib \
        moai-lib-sdl.lib \
        libjpg.lib \
        tinyxml.lib \
        sqlite.lib \
        libpng.lib \
        zl-lib-core.lib \
        zl-lib-gfx.lib \
        zl-lib-vfs.lib \
        tlsf.lib \
        zlib.lib \
        jansson.lib \
        libcrypto.lib \
        libcurl.lib \
        expat.lib \
        freetype.lib \
        kissfft.lib \
        libogg.lib \
        libpvr.lib \
        libssl.lib \
        libtess.lib \
        libvorbis.lib \
        libwebp.lib \
        lua-lib-5.1.lib \
        luaext.lib \
        mongoose.lib \
        sfmt.lib \
        sdl.lib \
        glew.lib \
        untz.lib \
        Gdi32.lib \
        winmm.lib \
        dsound.lib \
        strmiids.lib \
        advapi32.lib \
        comctl32.lib \
        oleaut32.lib \
        opengl32.lib \
        rpcrt4.lib \
        winmm.lib \
        wldap32.lib \
        ws2_32.lib \
        wsock32.lib \
        iphlpapi.lib \
        psapi.lib \
        imm32.lib \
        version.lib \
        kernel32.lib \
        user32.lib \
        gdi32.lib \
        winspool.lib \
        comdlg32.lib \
        advapi32.lib \
        shell32.lib \
        ole32.lib \
        oleaut32.lib \
        uuid.lib \
        odbc32.lib \
        odbccp32.lib
