package dao;


import entity.Leaved;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LeavedDao {
    /**
     * 通过ID查询单条数据
     *
     * @param leaveid 主键
     * @return 实例对象
     */
     Leaved queryById(Integer leaveid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    List<Leaved> queryAllByLimit(int offset, int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @return 对象列表
     */
    List<Leaved> queryAll();

    /**
     * 通过实体作为筛选条件查询
     *
     * @return 对象列表
     */
    List<Leaved> queryAllBynameAnddate(@Param("empname") String empname,@Param("createdate")String createdate,@Param("status")String status);

    /**
     * 新增数据
     *
     * @param leaved
     * @return 影响行数
     */
    int insert(Leaved leaved);

    /**
     * 批量新增数据（MyBatis原生foreach方法）
     *
     * @param entities List<Leaved> 实例对象列表
     * @return 影响行数
     */
    int insertBatch( List<Leaved> entities);

    /**
     * 批量新增或按主键更新数据（MyBatis原生foreach方法）
     *
     * @param entities List<Leaved> 实例对象列表
     * @return 影响行数
     */
    int insertOrUpdateBatch( List<Leaved> entities);

    /**
     * 修改数据
     *
     * @param leavel 实例对象
     * @return 影响行数
     */
    int update(Leaved leavel);

    /**
     * 修改数据
     *
     * @param leaveid 主键
     * @return 影响行数
     */
    int updateById(Integer leaveid);

    /**
     * 通过主键删除数据
     *
     * @param leaveid 主键
     * @return 影响行数
     */
    int deleteById(Integer leaveid);


    List<Leaved> queryAll(Object o);
}



