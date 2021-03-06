package com.wts.exam.dao;

import com.wts.exam.domain.Material;
import org.hibernate.Session;
import com.farm.core.sql.query.DBRule;
import com.farm.core.sql.query.DataQuery;
import com.farm.core.sql.result.DataResult;
import java.util.List;
import java.util.Map;

/* *
 *功能：引用材料数据库持久层接口
 *详细：
 *
 *版本：v0.1
 *作者：Farm代码工程自动生成
 *日期：20150707114057
 *说明：
 */
public interface MaterialDaoInter {
	/**
	 * 删除一个引用材料实体
	 * 
	 * @param entity
	 *            实体
	 */
	public void deleteEntity(Material material);

	/**
	 * 由引用材料id获得一个引用材料实体
	 * 
	 * @param id
	 * @return
	 */
	public Material getEntity(String materialid);

	/**
	 * 插入一条引用材料数据
	 * 
	 * @param entity
	 */
	public Material insertEntity(Material material);

	/**
	 * 获得记录数量
	 * 
	 * @return
	 */
	public int getAllListNum();

	/**
	 * 修改一个引用材料记录
	 * 
	 * @param entity
	 */
	public void editEntity(Material material);

	/**
	 * 获得一个session
	 */
	public Session getSession();

	/**
	 * 执行一条引用材料查询语句
	 */
	public DataResult runSqlQuery(DataQuery query);

	/**
	 * 条件删除引用材料实体，依据对象字段值(一般不建议使用该方法)
	 * 
	 * @param rules
	 *            删除条件
	 */
	public void deleteEntitys(List<DBRule> rules);

	/**
	 * 条件查询引用材料实体，依据对象字段值,当rules为空时查询全部(一般不建议使用该方法)
	 * 
	 * @param rules
	 *            查询条件
	 * @return
	 */
	public List<Material> selectEntitys(List<DBRule> rules);

	/**
	 * 条件修改引用材料实体，依据对象字段值(一般不建议使用该方法)
	 * 
	 * @param values
	 *            被修改的键值对
	 * @param rules
	 *            修改条件
	 */
	public void updataEntitys(Map<String, Object> values, List<DBRule> rules);

	/**
	 * 条件合计引用材料:count(*)
	 * 
	 * @param rules
	 *            统计条件
	 */
	public int countEntitys(List<DBRule> rules);

	/**
	 * 获得答卷的材料
	 * 
	 * @param paperId
	 * @return
	 */
	public List<Material> getMaterialsByPaperId(String paperId);

	/**通过UUID获得ID（無返回null）
	 * @param uuid
	 * @return
	 */
	public String getIdByUuid(String uuid);
}