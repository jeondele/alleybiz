package biz;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.AlleyDataBean;
import bean.DongDataBean;
import bean.ResultBean;
import bean.ResultDataBean;
import model.DataDAO;
import model.GetAreaCode;
import model.GetDongData;

@WebServlet("/data")
public class DataController extends HttpServlet {

   public DataController() {
   }

   protected void service(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html;charset=utf-8");

      String dong = request.getParameter("d");
      String gu = request.getParameter("g");
      String service = request.getParameter("service");

      if (dong == null) {
         request.getSession().setAttribute("areaCheck", "block");
         response.sendRedirect("mapService.jsp");
      } else if (service.length() < 2) {
         request.getSession().setAttribute("serviceCheck", "block");
         response.sendRedirect("mapService.jsp");

      } else {
         if (dong.equals("성동구")) {
            
         } else {
            ArrayList<String> codeList = getAreaCode(dong);
            if (codeList.size() >= 1) {
               ArrayList<AlleyDataBean> area = getAreaData(codeList);
               ResultDataBean result = getResult(dong, service, codeList);
               ArrayList<DongDataBean> datas = getDongData(dong, area);

               for (int i = 0; i < datas.size(); i++) {
                  request.getSession().setAttribute(String.format("area%d", i), datas.get(i));
               }
               request.getSession().setAttribute("result", result);
            } else {
               ArrayList<String> surCodeList = getSurAreaCode(gu, dong);
               ArrayList<AlleyDataBean> area = getAreaData(surCodeList);
               ResultDataBean result = getResult(dong, service, codeList);
               ArrayList<DongDataBean> datas = getDongData(dong, area);

               for (int i = 0; i < datas.size(); i++) {
                  request.getSession().setAttribute(String.format("area%d", i), datas.get(i));
               }
               request.getSession().setAttribute("result", result);
            }

            request.getSession().setAttribute("gu", gu);
            request.getSession().setAttribute("dong", dong);
            request.getSession().setAttribute("service", service);

            response.sendRedirect("mapAnalysis.jsp");
         }
      }

   }

   public static ArrayList<String> getSurAreaCode(String gu, String dong) {
      ArrayList<String[]> file;
      HashMap<String, ArrayList<String>> guMap;
      ArrayList<String> codeList = new ArrayList<>();
      try {

         file = GetAreaCode.getDataList();

         guMap = GetAreaCode.convertDongMap(file);
         ArrayList<String> dongList = guMap.get(gu);
         for (String dongs : dongList) {
            if (dongs == dong) {

            } else {
               ArrayList<String> codes = GetAreaCode.convertD2C(guMap, dong);
               if (codes.size() > 0) {
                  codeList.addAll(codes);
               } else {

               }

            }
         }
      } catch (IOException e) {
         e.printStackTrace();
         codeList = null;
      }
      return codeList;
   }

   public static ArrayList<String> getAreaCode(String dong) {

      HashMap<String, ArrayList<String>> dongMap;
      ArrayList<String> codeList;
      try {
         dongMap = GetAreaCode.convertCodeMap(GetAreaCode.getDataList());
         codeList = GetAreaCode.convertD2C(dongMap, dong);

      } catch (IOException e) {
         e.printStackTrace();
         codeList = null;
      }

      return codeList;
   }

   public static ArrayList<AlleyDataBean> getAreaData(ArrayList<String> codeList) {
      ArrayList<AlleyDataBean> area = new ArrayList<>();
      ArrayList<AlleyDataBean> data;
      for (String code : codeList) {
         try {
            code = code + ".0";
            data = DataDAO.selectArea(code);
            if (data == null) {

            } else {
               area.addAll(data);
            }

         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      return area;
   }

   public static ArrayList<AlleyDataBean> getSurAreaData(ArrayList<ArrayList<String>> codeList) {
      ArrayList<AlleyDataBean> area = new ArrayList<>();
      ArrayList<AlleyDataBean> data = null;
      for (ArrayList<String> codes : codeList) {
         for (String code : codes) {
            try {
               data = DataDAO.selectArea(code);
               if (data.size() > 0) {
                  area.addAll(data);
               } else {

               }
               area.addAll(data);
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
            }
         }
      }
      return area;
   }

   public static ArrayList<DongDataBean> getDongData(String dong, ArrayList<AlleyDataBean> area) {
      ArrayList<DongDataBean> dongData = GetDongData.getDongData(dong, area);
      return dongData;
   }

   public static ResultDataBean getResult(String dong, String service, ArrayList<String> codeList) {
      String serviceCode;
      ResultDataBean result = new ResultDataBean();
      int len = codeList.size();
      HashMap<String, Integer> classes = new HashMap<>();
      float per = 0;
      float sales = 0;

      if (service.equals("한식")) {
         serviceCode = "CS100001";
      } else if (service.equals("중식")) {
         serviceCode = "CS100002";
      } else if (service.equals("일식")) {
         serviceCode = "CS100003";
      } else if (service.equals("양식")) {
         serviceCode = "CS100004";
      } else if (service.equals("분식")) {
         serviceCode = "CS100005";
      } else if (service.equals("패스트푸드")) {
         serviceCode = "CS100006";
      } else if (service.equals("치킨")) {
         serviceCode = "CS100007";
      } else if (service.equals("제과")) {
         serviceCode = "CS100008";
      } else if (service.equals("커피·음료")) {
         serviceCode = "CS100009";
      } else if (service.equals("호프·간이주점")) {
         serviceCode = "CS100010";
      } else {
         serviceCode = "0";
      }

      for (String code : codeList) {
         try {
            code = code + ".0";
            ResultBean tmp = new ResultBean();
            tmp = DataDAO.selectResult(code, serviceCode);
            if (tmp == null) {
            } else {
               per += tmp.getPercentage();
               sales += tmp.getSales();
               String classValue = tmp.getEstimatedClass();
               if (classes.containsKey(classValue)) {
                  int val = classes.get(classValue);
                  val += 1;
                  classes.put(classValue, val);
               } else {
                  classes.put(classValue, 1);
               }

            }
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      per = per / len;
      per = per * 100;
      sales = sales / len;
      Set<String> keys = classes.keySet();
      int value = 0;
      String estClass = null;
      for (String k : keys) {
         int cnt = classes.get(k).intValue();
         if (value >= cnt) {

         } else {
            value = cnt;
            estClass = k;
         }
      }

      result.setDong(dong);
      result.setService(service);
      result.setSales(sales);
      result.setPercentage(per);
      result.setEstimatedClass(estClass);
      return result;
   }
}