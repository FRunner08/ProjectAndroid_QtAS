#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
//#include <QtQml>

#include "liste.h"
#include "listmodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    // build the imports
    qmlRegisterType<ListModel>("ToDo", 1, 0, "ListModel");
    qmlRegisterUncreatableType<Liste>("ToDo", 1, 0, "Liste", QStringLiteral("fixed without ui.qml"));

    Liste liste;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty(QStringLiteral("liste"), &liste);

    const QUrl url(QStringLiteral("qrc:/main.qml"));

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl) {
            QCoreApplication::exit(-1);
        }
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();

}
