create table `product_info` (
  `product_id`          varchar(32)   not null,
  `product_name`        varchar(64)   not null
  comment '商品名称',
  `product_price`       decimal(8, 2) not null
  comment '商品单价',
  `product_stock`       int           not null
  comment '库存',
  `product_description` varchar(64) comment '描述',
  `product_icon`        varchar(512) comment '小图',
  `category_type`       int           not null
  comment '类目编号',
  `create_time`         timestamp     not null default current_timestamp
  comment '创建时间',
  `update_time`         timestamp     not null default current_timestamp
  on update current_timestamp
  comment '更新时间',
  primary key (`product_id`)
)
  comment '商品表';

create table `product_category` (
  `category_id`   int         not null auto_increment,
  `category_name` varchar(64) not null
  comment '类目名字',
  `category_type` int         not null
  comment '类目编号',
  `create_time`   timestamp   not null default current_timestamp
  comment '创建时间',
  `update_time`   timestamp   not null default current_timestamp
  on update current_timestamp,
  primary key (`category_id`),
  unique key `uqe_category_type`(`category_type`)
)
  comment '类目表';

create table `order_master` (
  `order_id`      varchar(32)   not null,
  `buyer_name`    varchar(32)   not null
  comment '买家名字',
  `buyer_phone`   varchar(32)   not null
  comment '买家电话',
  `buyer_address` varchar(128)  not null
  comment '买家地址',
  `buyer_openid`  varchar(64)   not null
  comment '买家openid',
  `order_amount`  decimal(8, 2) not null
  comment '订单总金额',
  `order_status`  tinyint       not null default 0
  comment '订单状态 默认0 下单',
  `pay_status`    tinyint       not null default 0
  comment '支付状态,默认0 未支付',
  `create_time`   timestamp     not null default current_timestamp
  comment '创建时间',
  `update_time`   timestamp     not null default current_timestamp
  on update current_timestamp,
  primary key (`order_id`),
  key `idx_buyer_openid`(buyer_openid)

)
  comment '订单表';


create table `order_detail` (
  `detail_id`        varchar(32)   not null,
  `order_id`         varchar(32)   not null,
  `product_id`       varchar(32)   not null,
  `product_name`     varchar(64)   not null
  comment '商品名称',
  `product_price`    decimal(8, 2) not null,
  `product_quantity` int           not null
  comment '商品数量',
  `product_icon`     varchar(512)  not null
  comment '商品小图',
  `create_time`      timestamp     not null default current_timestamp
  comment '创建时间',
  `update_time`      timestamp     not null default current_timestamp
  on update current_timestamp,
  primary key (`order_id`),
  key `idx_order_id`(`order_id`)
)
  comment '订单详情';

create table `seller_info` (
  `user_id`     varchar(32) not null,
  `username`    varchar(32) not null,
  `password`    varchar(32) not null,
  `openid`      varchar(64) not null
  comment '微信openid',
  `create_time` timestamp   not null default current_timestamp
  comment '创建时间',
  `update_time` timestamp   not null default current_timestamp
  on update current_timestamp
)
  comment '买家信息表';
