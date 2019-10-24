#include "liste.h"

Liste::Liste(QObject *parent)
    : QObject(parent)
{
    //first given item - can be removed
    mItems.append({false, QStringLiteral("Tip and tip")});
}

QVector<ListItem> Liste::items() const
{
    return mItems;
}

bool Liste::setItemAt(int index, const ListItem &item)
{
    if (index < 0 || index >= mItems.size()) {
        return false;
    }

    const ListItem &oldItem = mItems.at(index);
    if (item.done == oldItem.done && item.description == oldItem.description) {
        return false;
    }

    mItems[index] = item;
    return true;
}

void Liste::appendItem()
{
    emit preItemAppended();

    ListItem item;
    item.done = false;
    mItems.append(item);

    emit postItemAppended();
}

void Liste::removeDoneItems()
{
    for (int i = 0; i < mItems.size(); ) {
        if (mItems.at(i).done == true) {
            emit preItemRemoved(i);

            mItems.removeAt(i);

            emit postItemRemoved();
        } else {
            ++i;
        }
    }
}




