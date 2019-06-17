package com.cg.digi.service;

import java.util.Comparator;

import com.cg.digi.model.DeviceCatalog;

public class DeviceVersionSort implements Comparator<DeviceCatalog>{

	


	@Override
	public int compare(DeviceCatalog d1, DeviceCatalog d2) {
		return (int) (Float.parseFloat(d2.getVersion().split("\\.")[0].trim())-Float.parseFloat(d1.getVersion().split("\\.")[0].trim()));
	}

}
