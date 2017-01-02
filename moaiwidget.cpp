#include "moaiwidget.h"
#include <QGLWidget>
#include <QOpenGLFunctions>
#include <QMouseEvent>
#include <QKeyEvent>
#include "host-modules/aku_modules.h"

static MoaiWidget *gwindow;

enum
{
    KEYBOARD = 0,
    POINTER,
    MOUSE_LEFT,
    MOUSE_MIDDLE,
    MOUSE_RIGHT,
    TOTAL
};

MoaiWidget::MoaiWidget(QWidget *parent) : QGLWidget (parent)
{
    this->windowReady = false;
    gwindow = this;

    this->setSizePolicy(QSizePolicy::Ignored, QSizePolicy::Ignored);
    this->setFocusPolicy(Qt::ClickFocus);
}

void MoaiWidget::initializeGL()
{
    refreshContext();

    glClearColor(1.0f, 1.0f, 1.0f, 1.0f);

    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(simStep()));

    timer->start(1000*AKUGetSimStep());
}

void MoaiWidget::resizeGL(int w, int h)
{
    if(this->windowReady)
    {
        AKUSetScreenSize(w, h);
        AKUSetViewSize(w,h);
    }
}

void MoaiWidget::paintGL()
{
    if(this->windowReady)
        AKURender();
//    else
//    {
//        glClear(GL_COLOR_BUFFER_BIT);
//    }
}

QSize MoaiWidget::sizeHint()
{
    return QSize(640,480);
}

void _AKUOpenWindowFunc ( const char* title, int width, int height )
{
    AKUDetectGfxContext();
    int w =gwindow->size().width();
    int h = gwindow->size().height();
    //AKUSetScreenSize(w, h);
    AKUSetViewSize(w, h);
    gwindow->windowReady = true;
    gwindow->setWindowTitle(QString(title));
}

void MoaiWidget::refreshContext()
{
    AKUContextID context =  AKUGetContext();

    if(context)
    {
        AKUDeleteContext(context);
    }

    AKUAppInitialize();
    AKUModulesAppInitialize();

    AKUCreateContext();
    AKUModulesContextInitialize();
    AKUModulesRunLuaAPIWrapper();

    AKUSetInputConfigurationName("AKUQtEditor");
    AKUReserveInputDevices          ( 1 );
    AKUSetInputDevice               ( 0, "device" );
    AKUReserveInputDeviceSensors    ( 0, TOTAL );
    AKUSetInputDeviceKeyboard       ( 0, KEYBOARD,     "keyboard" );
    AKUSetInputDevicePointer        ( 0, POINTER,      "pointer" );
    AKUSetInputDeviceButton         ( 0, MOUSE_LEFT,   "mouseLeft" );
    AKUSetInputDeviceButton         ( 0, MOUSE_MIDDLE, "mouseMiddle" );
    AKUSetInputDeviceButton         ( 0, MOUSE_RIGHT,  "mouseRight" );

    AKUSetFunc_OpenWindow ( _AKUOpenWindowFunc );


    AKUSetWorkingDirectory("D:/1.CurrentProjects/git/moai-dev/samples/box2d");

    if ( AKULoadFuncFromFile ( "main.lua" ) != AKU_OK )
        return;
    AKUCallFunc ();
}

void MoaiWidget::simStep()
{
    if(this->windowReady)
    {
        AKUModulesUpdate ();
        //AKUUpdate();

        this->update();
    }
}

void MoaiWidget::mouseMoveEvent(QMouseEvent* event)
{
    AKUEnqueuePointerEvent(0, POINTER, event->x(), event->y());
}

void MoaiWidget::mousePressEvent(QMouseEvent* event)
{
    if(event->button() == Qt::LeftButton)
    {
        AKUEnqueueButtonEvent(0, MOUSE_LEFT, true);
    }

    if(event->button() == Qt::MidButton)
    {
        AKUEnqueueButtonEvent(0, MOUSE_MIDDLE, true);
    }

    if(event->button() == Qt::RightButton)
    {
        AKUEnqueueButtonEvent(0, MOUSE_RIGHT, true);
    }
}

void MoaiWidget::mouseReleaseEvent(QMouseEvent* event)
{
    if(event->button() == Qt::LeftButton)
    {
        AKUEnqueueButtonEvent(0, MOUSE_LEFT, false);
    }

    if(event->button() == Qt::MidButton)
    {
        AKUEnqueueButtonEvent(0, MOUSE_MIDDLE, false);
    }

    if(event->button() == Qt::RightButton)
    {
        AKUEnqueueButtonEvent(0, MOUSE_RIGHT, false);
    }
}

void MoaiWidget::keyPressEvent(QKeyEvent* event)
{
    AKUEnqueueKeyboardKeyEvent(0, KEYBOARD, event->key(), true);
}

void MoaiWidget::keyReleaseEvent(QKeyEvent* event)
{
    AKUEnqueueKeyboardKeyEvent(0, KEYBOARD, event->key(), false);
}
