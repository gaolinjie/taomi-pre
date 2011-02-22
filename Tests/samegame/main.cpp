#include <QtGui/QApplication>
#include <QtDeclarative/QDeclarativeView>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    QDeclarativeView view;
    view.setSource(QUrl("qrc:/samegame.qml"));
    view.show();

    return a.exec();
}
