package dao;

import entity.Flow;

import java.util.List;

public   interface   FlowDao {

    /**
     * 通过ID查询单条数据
     *
     * @param fid 主键
     * @return 实例对象
     */
    Flow queryById(Integer fid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    List<Flow> queryAllByLimit(int offset, int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param flow 实例对象
     * @return 对象列表
     */
    List<Flow> queryAll(Flow flow);

    /**
     * 新增数据
     *
     * @param flow 实例对象
     * @return 影响行数
     */
    int insert(Flow flow);

    /**
     * 批量新增数据（MyBatis原生foreach方法）
     *
     * @param entities List<Flow> 实例对象列表
     * @return 影响行数
     */
    int insertBatch( List<Flow>  entities);

    /**
     * 批量新增或按主键更新数据（MyBatis原生foreach方法）
     *
     * @param entities List<Flow> 实例对象列表
     * @return 影响行数
     */
    int insertOrUpdateBatch( List<Flow> entities);

    /**
     * 修改数据
     *
     * @param flow 实例对象
     * @return 影响行数
     */
    int update(Flow flow);

    /**
     * 通过主键删除数据
     *
     * @param fid 主键
     * @return 影响行数
     */
    int deleteById(Integer fid);

}

