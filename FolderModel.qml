import QtQuick 2.0

import QtQuick 2.0
import Qt.labs.folderlistmodel 1.0


FolderListModel {
    id: folderModel
    folder: "file:///C:/content/"
    showDirs: true
    nameFilters: ["*"]
}

