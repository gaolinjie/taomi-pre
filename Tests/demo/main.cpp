#include <QtGui/QApplication>
#include <QtDeclarative/QDeclarativeView>
#include <QObject>

int main(int argc, char *argv[])
{
    QApplication::setGraphicsSystem("raster");
    QApplication a(argc, argv);

    QDeclarativeView view;
    view.setSource(QUrl("file:///home/gao/taomi/Tests/demo/ui.qml"));

//  view.showFullScreen();
    view.show();

    return a.exec();
}
