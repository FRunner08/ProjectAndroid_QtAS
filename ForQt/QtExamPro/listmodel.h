#ifndef LISTMODEL_H
#define LISTMODEL_H

#include <QAbstractListModel>

class Liste;

class ListModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(Liste *list READ list WRITE setList)

public:
    //constructor
    explicit ListModel(QObject *parent = nullptr);

    enum {
        DoneRole = Qt::UserRole,
        DescriptionRole
    };

    // returns the number of rows of the list model
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // set the data
    bool setData(const QModelIndex &index, const QVariant &value,
                 int role = Qt::EditRole) override;

    Qt::ItemFlags flags(const QModelIndex& index) const override;

    // name of functions
    virtual QHash<int, QByteArray> roleNames() const override;

    // construct list
    Liste *list() const;
    void setList(Liste *list);

private:
    Liste *mList;
};

#endif // LISTMODEL_H
