package cn.edu.zjut.view;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import cn.edu.zjut.util.PageData;
import cn.edu.zjut.util.Tools;

public class ProgramExcelView extends AbstractExcelView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		/*[PageData 
		 * [map={channel_name=东方卫视高清, g_id=269263, province=上海, 
		 *       endtime=2015-11-01 01:27:00.0, id=7, program=女神新装, 
		 *       starttime=2015-10-31 23:42:00.0, during=6300, channel_id=2803}, 
		 *       request=null],  */
		
		//电视台名称 	省份 	电视台编码 	节目名称 	开始时间 	结束时间 	持续时间（s） 	
		Date date = new Date();
		String filename = Tools.date2Str(date, "yyyyMMddHHmmss");
		HSSFSheet sheet;
		HSSFCell cell;
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+filename+".xls");
		sheet = workbook.createSheet("用户观看电视节目信息");
		
		@SuppressWarnings("unchecked")
		List<String> titles = (List<String>) model.get("titles");
		int len = titles.size();
		HSSFCellStyle headerStyle = workbook.createCellStyle(); //标题样式
		headerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		headerStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		
		HSSFFont headerFont = workbook.createFont();	//标题字体
		headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		headerFont.setFontHeightInPoints((short)11);
		headerStyle.setFont(headerFont);
		short width = 20,height=25*20;
		sheet.setDefaultColumnWidth(width);
		for(int i=0; i<len; i++){ //设置标题
			String title = titles.get(i);
			cell = getCell(sheet, 0, i);
			cell.setCellStyle(headerStyle);
			setText(cell,title);
		}
		sheet.getRow(0).setHeight(height);
		
		HSSFCellStyle contentStyle = workbook.createCellStyle(); //内容样式
		contentStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		@SuppressWarnings("unchecked")
		List<PageData>  programList =  (List<PageData>) model.get("programList");
		int programCount = programList.size();
		for(int i=0; i<programCount; i++){
			/*[PageData 
			 * [map={channel_name=东方卫视高清, g_id=269263, province=上海, 
			 *       endtime=2015-11-01 01:27:00.0, id=7, program=女神新装, 
			 *       starttime=2015-10-31 23:42:00.0, during=6300, channel_id=2803}, 
			 *       request=null],  */
			
			//电视台名称 	省份 	电视台编码 	节目名称 	开始时间 	结束时间 	持续时间（s） 	
			PageData pd = programList.get(i);
			String channel_name = (String) pd.get("channel_name");
			cell = getCell(sheet, i+1, 0);
			cell.setCellStyle(contentStyle);
			setText(cell,channel_name);
			
			String province = (String) pd.get("province");
			cell = getCell(sheet, i+1, 1);
			cell.setCellStyle(contentStyle);
			setText(cell,province);
			
			String channel_id = (String) pd.get("channel_id");
			cell = getCell(sheet, i+1, 2);
			cell.setCellStyle(contentStyle);
			setText(cell,channel_id);
			
			String program = (String) pd.get("program");
			cell = getCell(sheet, i+1, 3);
			cell.setCellStyle(contentStyle);
			setText(cell,program);
			
			Date starttime = (Date) (pd.get("starttime")!=null ? pd.get("endtime") : "");
			cell = getCell(sheet, i+1, 4);
			cell.setCellStyle(contentStyle);
			setText(cell,Tools.date2Str(starttime));
			
			Date endtime = (Date) (pd.get("endtime")!=null ? pd.get("endtime") : "");
			cell = getCell(sheet, i+1, 5);
			cell.setCellStyle(contentStyle);
			setText(cell,Tools.date2Str(endtime));
			
			String during = (String) pd.get("during");
			cell = getCell(sheet, i+1, 6);
			cell.setCellStyle(contentStyle);
			setText(cell,during);
		}
		
	}

}
