/**
 * 
 */
package edu.mju.xiaoqu.util;

import java.util.Collection;

/**
 * @author joeyang ong
 *
 */
public class Page {
	
    private Integer pageNo;    //��ǰҳ��     *
    private Integer pageSize;  //ÿҳ��¼����  *
    private Boolean nextPage;  //�Ƿ�����һҳ
    private Boolean prePage;   //�Ƿ�����һҳ
    private Long totalRecNum;  //�ܹ��ж�������¼ (ҳ��������Ĳ�ѯ���ܹ��ж�������¼��*
    private Integer totalPageNum;//�ܹ�����ҳ 
    private Collection pageContent; //��ҳ������(��¼��ϸ) *
    private Integer startIndex; //��¼��ʼλ��
    private Integer endIndex;   //��¼����λ��
        
	public Page() {
		super();
        pageNo=1;
        pageSize=3;
	}
	
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	public Boolean getNextPage() {
		return pageNo<getTotalPageNum()?true:false;
	}

	public Boolean getPrePage() {
		return pageNo>1?true:false;
	}

	public Long getTotalRecNum() {
		return totalRecNum;
	}
	public void setTotalRecNum(Long totalRecNum) {
		this.totalRecNum = totalRecNum;
	}
	
	public Integer getTotalPageNum() {
		return totalRecNum%pageSize>0?(int)(totalRecNum/pageSize+1):(int)(totalRecNum/pageSize);		
	}

	public Collection getPageContent() {
		return pageContent;
	}
	
	public void setPageContent(Collection pageContent) {
		this.pageContent = pageContent;
	}
    
	public int getStartIndex()
	{
		return pageSize*(pageNo-1);  // size:10 pageno:3   21
	}
    
	public int getEndIndex()
	{
		return (pageSize*pageNo>this.totalRecNum)? (int)(this.totalRecNum.longValue()):(pageSize*pageNo);
	}

	@Override
	public String toString() {
		return "Page [pageNo=" + pageNo + ", pageSize=" + pageSize + ", nextPage=" + nextPage + ", prePage=" + prePage
				+ ", totalRecNum=" + totalRecNum + ", totalPageNum=" + totalPageNum + ", pageContent=" + pageContent
				+ ", startIndex=" + startIndex + ", endIndex=" + endIndex + "]";
	}
	
	

}
