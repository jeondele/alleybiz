package model;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

public class GetAreaCode {
	public static ArrayList<String[]> getDataList() throws IOException {
		ArrayList<String[]> dataList = new ArrayList<>();
		try {
			BufferedReader in = new BufferedReader(
					new FileReader("C:\\Users\\user\\git\\alleybiz\\mapSearch\\WebContent\\code.csv"));
			String value = in.readLine();
			while (value != null) {
				String[] split = value.split(",");
				dataList.add(split);
				value = in.readLine();

			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataList;
	}

	public static HashMap<String, ArrayList<String>> convertCodeMap(ArrayList<String[]> file) {
		HashMap<String, ArrayList<String>> areaData = new HashMap<>();
		int len = file.size();
		for (int i = 0; i < len; i++) {
			String[] line = file.get(i);

			String code = line[0];
			String dong = line[2];
			
			if (areaData.containsKey(dong)) {
				areaData.get(dong).add(code);
			} else {
				ArrayList<String> codeL = new ArrayList<>();
				codeL.add(code);
				areaData.put(dong, codeL);
			}
		}
		return areaData;
	}

	public static HashMap<String, ArrayList<String>> convertDongMap(ArrayList<String[]> file) {
		HashMap<String, ArrayList<String>> areaData = new HashMap<>();
		int len = file.size();
		for (int i = 0; i < len; i++) {
			String[] line = file.get(i);
			String gu = line[1];
			String dong = line[2];
			if (areaData.containsKey(gu)) {
				areaData.get(gu).add(dong);
			} else {
				ArrayList<String> codeL = new ArrayList<>();
				codeL.add(dong);
				areaData.put(gu, codeL);
			}
		}
		return areaData;
	}

	public static ArrayList<String> convertD2C(HashMap<String, ArrayList<String>> map, String dong) {

		ArrayList<String> codeList = new ArrayList<String>();
		if (map.containsKey(dong)) {
			codeList = map.get(dong);
		} else {
			codeList = null;
		}
		return codeList;
	}

}
