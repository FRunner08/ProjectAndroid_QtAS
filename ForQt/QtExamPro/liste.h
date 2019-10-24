#ifndef LISTE_H
#define LISTE_H

#include <QObject>
#include <QVector>

struct ListItem {
    bool done;
    QString description;
};

class Liste : public QObject
{
    Q_OBJECT

public:
    // constructor
    explicit Liste(QObject *parent = nullptr);

    // return a list of items
    QVector<ListItem> items() const;

    // item at point x of the list
    bool setItemAt(int index, const ListItem &item);
signals:
    // how to add and to delete an item
    void preItemAppended();
    void postItemAppended();

    void preItemRemoved(int index);
    void postItemRemoved();

public slots:
    // functions of the buttons
    void appendItem();
    void removeDoneItems();

private:
    QVector<ListItem> mItems;
};

#endif // LISTE_H
