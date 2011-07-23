#include <QtGui/QApplication>
#include <QtDeclarative/QDeclarativeView>
#include <QObject>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    QDeclarativeView view;
    view.setSource(QUrl("qrc:/main.qml"));

//  view.showFullScreen();
    view.show();

    return a.exec();
}
