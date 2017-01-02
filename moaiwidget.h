#ifndef MOAIWIDGET_H
#define MOAIWIDGET_H

#include <QObject>
#include <QTimer>
#include <QGLWidget>

class MoaiWidget : public QGLWidget
{
    Q_OBJECT


public:
    explicit MoaiWidget(QWidget *parent = 0);
    void initializeGL();
    void resizeGL(int w, int h);
    void paintGL();

    QSize sizeHint();
    void refreshContext();

    void mouseMoveEvent(QMouseEvent* event);
    void mousePressEvent(QMouseEvent* event);
    void mouseReleaseEvent(QMouseEvent* event);

    void keyPressEvent(QKeyEvent* event);
    void keyReleaseEvent(QKeyEvent* event);

    bool windowReady;
    QTimer *timer;
signals:

public slots:
    void simStep();
};

#endif // MOAIWIDGET_H
