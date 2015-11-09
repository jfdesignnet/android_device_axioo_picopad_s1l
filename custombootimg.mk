$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk)
	@echo ----- Making recovery image ------
	perl device/axioo/picopad_s1l/repack-MT65xx.pl -recovery device/axioo/picopad_s1l/prebuilt/kernel out/target/product/picopad_s1l/recovery/root $@ $(MKBOOTIMG)
	@echo ----- Made recovery image -------- $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)


$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	perl device/axioo/picopad_s1l/repack-MT65xx.pl -boot device/axioo/picopad_s1l/prebuilt/kernel out/target/product/picopad_s1l/root $@ $(MKBOOTIMG)
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
