#ifndef MEDIA
#define MEDIA

#include <QtMultimedia/QMediaPlayer>
#include<QObject>


class Media : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString source READ getSource WRITE setSource )


public:
    explicit Media(QObject *parent = 0);
    QString getSource() const ;
    void setSource(const QString &source);

    Q_INVOKABLE void name(QMediaPlayer *player);


signals:

public slots:


private:
QString mSource;


};



#endif // MEDIA

