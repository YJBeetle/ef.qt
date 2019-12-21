for(file, EFML){
        fileBaseName = $$basename(file)
        fileBaseNameNoExt = $$section(fileBaseName, ., 0, -2)

        targetName = ef_$${fileBaseNameNoExt}.hpp

        $${targetName}.commands = efqt generate -f $$PWD/$${file} -o $$targetName

        QMAKE_EXTRA_TARGETS += $${targetName}

        PRE_TARGETDEPS += $${targetName}
}