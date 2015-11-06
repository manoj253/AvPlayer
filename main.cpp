#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <QDir>
#include "media.h"
#include<QAbstractItemModel>



int main(int argc, char *argv[])
{


    qmlRegisterType<Media>("Life.Plank.Media", 1, 0, "Media");

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

