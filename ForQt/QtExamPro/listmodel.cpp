#include "listmodel.h"

#include "liste.h"

ListModel::ListModel(QObject *parent)
    : QAbstractListModel(parent)
    , mList(nullptr)
{
}

int ListModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid() || !mList)
        return 0;

    return mList->items().size();
}

QVariant ListModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || !mList)
        return QVariant();

    const ListItem item = mList->items().at(index.row());

    switch (role) {
        case DoneRole:
            return QVariant(item.done);
        case DescriptionRole:
            return  QVariant(item.description);
    }

    return QVariant();
}

bool ListModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if (!mList) {
        return false;
    }

    ListItem item = mList->items().at(index.row());

    switch (role) {
        case DoneRole:
            item.done = value.toBool();
            break;
        case DescriptionRole:
            item.description = value.toString();
            break;
    }

    if (mList->setItemAt(index.row(), item)) {
        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

Qt::ItemFlags ListModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;

    return Qt::ItemIsEditable;
}

QHash<int, QByteArray> ListModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[DoneRole] = "done";
    names[DescriptionRole] = "description";
    return names;
}

Liste *ListModel::list() const
{
    return mList;
}

void ListModel::setList(Liste *list)
{
    beginResetModel();

    if (mList) {
        mList->disconnect(this);
    }

    mList = list;

    if (mList) {
        connect(mList, &Liste::preItemAppended, this, [=]() {
            const int index = mList->items().size();
            beginInsertRows(QModelIndex(), index, index);
        });
        connect(mList, &Liste::postItemAppended, this, [=]() {
            endInsertRows();
        });
        connect(mList, &Liste::preItemRemoved, this, [=](int index) {
            beginRemoveRows(QModelIndex(), index, index);
        });
        connect(mList, &Liste::postItemRemoved, this, [=]() {
            endRemoveRows();
        });
    }

    endResetModel();
}
