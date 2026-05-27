修复model.json
python live2d_json_fixer.py --scan "魂器学院 (炼铜学院)"

该文件夹名
.\add_prefix_to_folders.ps1 -TargetFolder "path" -Prefix "prefix"

清理音频
.\delete_audio_files.ps1 -TargetFolder "魂器学院 (炼铜学院)"

打zip
.\pack-subdirs.ps1 "魂器学院 (炼铜学院)"

.\pack-subdirs.ps1 "src/少女次元"
.\pack-subdirs.ps1 ".\live2d-model-assets\girls_frontline"
.\pack-subdirs.ps1 ".\live2d-model-assets\hyperdimension_neptunia"
.\pack-subdirs.ps1 ".\live2d-model-assets\moc"
.\pack-subdirs.ps1 ".\live2d-model-assets\moc3"

 