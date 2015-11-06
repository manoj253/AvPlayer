#include <QtDebug>
#include <QUrl>
#include <QMediaPlayer>
#include "media.h"


Media::Media(QObject *parent) : QObject(parent)
{
}
QString Media::getSource() const {
    return mSource;
}

void Media::setSource(const QString &source)
{
    mSource = source;
}
void Media::name(QMediaPlayer *player)
{

    player->setMedia(QUrl::fromLocalFile("C:/Users/Public/Videos/Sample Videos/Wildlife.wmv"));

}
