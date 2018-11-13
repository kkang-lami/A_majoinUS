package controller.JEJ;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import dao.JEJ;
import project.DTO.MemberDTO;
import project.DTO.PageDTO;

@Controller
public class MemberManageController {

	@Autowired
	private JEJ service;
	
	public void setService(JEJ service) {
		this.service = service;
	}
	
	//엑셀 파일 다운로드	
	@RequestMapping(value = "/aus/ExcelDownload")
	public void excelDown(HttpServletResponse response) throws Exception {
		
		// 회원 목록조회
		List<MemberDTO> list = service.excel_member();
		
		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("회원 목록");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;

		// 테이블 헤더용 스타일
		CellStyle headStyle = wb.createCellStyle();
		// 가는 경계선
		headStyle.setBorderTop(BorderStyle.THIN);
		headStyle.setBorderBottom(BorderStyle.THIN);
		headStyle.setBorderLeft(BorderStyle.THIN);
		headStyle.setBorderRight(BorderStyle.THIN);
		// 배경색
		headStyle.setFillForegroundColor(HSSFColorPredefined.BLUE_GREY.getIndex());
		headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		// 데이터 가운데 정렬
		headStyle.setAlignment(HorizontalAlignment.CENTER);
		
		// 데이터용 경계 스타일
		CellStyle bodyStyle = wb.createCellStyle();
		bodyStyle.setBorderTop(BorderStyle.THIN);
		bodyStyle.setBorderBottom(BorderStyle.THIN);
		bodyStyle.setBorderLeft(BorderStyle.THIN);
		bodyStyle.setBorderRight(BorderStyle.THIN);
		bodyStyle.setAlignment(HorizontalAlignment.CENTER);
		
		//각 칼럼 별 너비
		sheet.setColumnWidth(0, 350 * 20);
		sheet.setColumnWidth(1, 120 * 20);
		sheet.setColumnWidth(2, 280 * 20);
		sheet.setColumnWidth(3, 80 * 20);
		sheet.setColumnWidth(4, 200 * 20);

		// 헤더 생성
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellStyle(headStyle);
		cell.setCellValue("아이디");
		cell = row.createCell(1);
		cell.setCellStyle(headStyle);
		cell.setCellValue("이름");
		cell = row.createCell(2);
		cell.setCellStyle(headStyle);
		cell.setCellValue("연락처");
		cell = row.createCell(3);
		cell.setCellStyle(headStyle);
		cell.setCellValue("평점");
		cell = row.createCell(4);
		cell.setCellStyle(headStyle);
		cell.setCellValue("블랙리스트 여부");
		
		
		// 데이터 부분 생성
		for(MemberDTO vo : list) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getId());
			cell = row.createCell(1);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getName());
			cell = row.createCell(2);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getPhone());
			cell = row.createCell(3);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getEval());
			cell = row.createCell(4);
			cell.setCellStyle(bodyStyle);
			cell.setCellValue(vo.getBlacklist());
		}
		
		// 엑셀 출력
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=MemberList.xls");
		
		wb.write(response.getOutputStream());
		wb.close();
	}
	
	
	@RequestMapping(value = "/aus/MemberManage")
	public String member_manage(Model model, @RequestParam(value="pageNum", defaultValue="1")int pageNum, String search, String string) throws Exception {
		
		//
		int pageSize = 4;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int number = 0;
		int count = 0;
		
		List<MemberDTO> memberList = null;
		
		if(search==null) { // 서치가 없을떄
        	count = service.count_member(); // 전체 글 수
        	if(count > 0) {
    			PageDTO dto = new PageDTO();
    			dto.setEndRow(endRow);
    			dto.setStartRow(startRow);
    			memberList = service.getMember(dto);
        	}
        	
        } else { // 서치가 있을때

        	count = service.member_search_count(search, string);
        	if(count > 0) {
        		
        		memberList = service.member_search_list(search, string, startRow, endRow);
        		model.addAttribute("search1",1);
        		model.addAttribute("string",string);
        		model.addAttribute("search",search);
        	}
        }
			
		number=count-(currentPage-1)*pageSize;
		
		model.addAttribute("number",number);
		model.addAttribute("count",count);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("memberList",memberList);
		
		
		//블랙리스트 조회
		model.addAttribute("blackList", service.getBlackList());
		
		//신고 3번 누적 시 자동으로 블랙리스트에 추가
		//service.autoBlackList();
		
		return "JEJ/MemberManage";
	}
	

	//블랙리스트에 추가
	@RequestMapping(value = "/aus/blacklistMember")
	public String blacklistMember(Model model, String id) {
		service.updateBlackList(id);
		return "redirect:/aus/MemberManage";
	}
	
	
	//블랙리스트 권한복귀
	@RequestMapping(value = "/aus/authorityBack")
	public String authorityBack(Model model, String id) {		
		service.updateBlackListBack(id);				
		return "redirect:/aus/MemberManage";
	}
}
