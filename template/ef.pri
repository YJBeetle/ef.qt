for(file, DISTFILES){
        fileBaseName = $$basename(file)
        fileBaseNameExt = $$section(fileBaseName, ., -1, -1)
        equals(fileBaseNameExt, 'eft') {
                fileBaseNameNoExt = $$section(fileBaseName, ., 0, -2)

                targetName = ef_$${fileBaseNameNoExt}.hpp

                $${targetName}.commands = efqt generate -f $$PWD/$${file} -o $$targetName
                $${targetName}.depends = $$PWD/$${file}

                QMAKE_EXTRA_TARGETS += $${targetName}

                PRE_TARGETDEPS += $${targetName}
        }
}