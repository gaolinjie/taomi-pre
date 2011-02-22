#include <QtGui/QApplication>
#include <QtDeclarative/QDeclarativeView>
#include <QObject>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    QDeclarativeView view;
    view.setSource(QUrl("qrc:/main.qml"));

    QObject *object = (QObject*)view.rootObject();
    QObject::connect(object, SIGNAL(close()), &a, SLOT(quit()));

    view.showFullScreen();

    return a.exec();
}

