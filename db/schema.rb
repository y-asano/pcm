# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "API_CERTIFICATE", primary_key: "USER_NO", force: true do |t|
    t.string "API_ACCESS_ID",  limit: 100, null: false
    t.string "API_SECRET_KEY", limit: 100, null: false
  end

  add_index "API_CERTIFICATE", ["API_ACCESS_ID"], name: "API_CERTIFICATE_UK1", unique: true, using: :btree
  add_index "API_CERTIFICATE", ["API_SECRET_KEY"], name: "API_CERTIFICATE_UK2", unique: true, using: :btree

  create_table "AUTHORITY_SET", primary_key: "SET_NO", force: true do |t|
    t.string  "SET_NAME",        limit: 30
    t.boolean "FARM_USE"
    t.boolean "SERVER_MAKE"
    t.boolean "SERVER_DELETE"
    t.boolean "SERVER_OPERATE"
    t.boolean "SERVICE_MAKE"
    t.boolean "SERVICE_DELETE"
    t.boolean "SERVICE_OPERATE"
    t.boolean "LB_MAKE"
    t.boolean "LB_DELETE"
    t.boolean "LB_OPERATE"
  end

  add_index "AUTHORITY_SET", ["SET_NAME"], name: "AUTHORITY_SET_UK1", unique: true, using: :btree

  create_table "AUTO_SCALING_CONF", primary_key: "LOAD_BALANCER_NO", force: true do |t|
    t.integer "FARM_NO",        limit: 8,  null: false
    t.integer "PLATFORM_NO",    limit: 8,  null: false
    t.integer "IMAGE_NO",       limit: 8,  null: false
    t.string  "INSTANCE_TYPE",  limit: 20
    t.string  "NAMING_RULE",    limit: 30
    t.integer "IDLE_TIME_MAX",  limit: 8,  null: false
    t.integer "IDLE_TIME_MIN",  limit: 8,  null: false
    t.integer "CONTINUE_LIMIT", limit: 8,  null: false
    t.integer "ADD_COUNT",      limit: 8,  null: false
    t.integer "DEL_COUNT",      limit: 8,  null: false
    t.boolean "ENABLED"
  end

  add_index "AUTO_SCALING_CONF", ["FARM_NO"], name: "AUTO_SCALING_CONF_FK1", using: :btree

  create_table "AWS_ADDRESS", primary_key: "ADDRESS_NO", force: true do |t|
    t.integer "USER_NO",     limit: 8,   null: false
    t.integer "PLATFORM_NO", limit: 8,   null: false
    t.string  "PUBLIC_IP",   limit: 100
    t.string  "COMMENT",     limit: 100
    t.integer "INSTANCE_NO", limit: 8
    t.string  "INSTANCE_ID", limit: 20
  end

  add_index "AWS_ADDRESS", ["INSTANCE_NO"], name: "AWS_ADDRESS_FK2", using: :btree
  add_index "AWS_ADDRESS", ["PLATFORM_NO"], name: "AWS_ADDRESS_FK3", using: :btree
  add_index "AWS_ADDRESS", ["USER_NO"], name: "AWS_ADDRESS_FK1", using: :btree

  create_table "AWS_CERTIFICATE", id: false, force: true do |t|
    t.integer "USER_NO",        limit: 8,   null: false
    t.integer "PLATFORM_NO",    limit: 8,   null: false
    t.string  "AWS_ACCESS_ID",  limit: 100, null: false
    t.string  "AWS_SECRET_KEY", limit: 100, null: false
    t.string  "DEF_KEYPAIR",    limit: 100
    t.string  "DEF_SUBNET",     limit: 30
    t.string  "DEF_LB_SUBNET",  limit: 100
  end

  add_index "AWS_CERTIFICATE", ["PLATFORM_NO"], name: "AWS_CERTIFICATE_FK2", using: :btree

  create_table "AWS_INSTANCE", primary_key: "INSTANCE_NO", force: true do |t|
    t.string "KEY_NAME",           limit: 100
    t.string "INSTANCE_TYPE",      limit: 20
    t.string "SECURITY_GROUPS",    limit: 100
    t.string "AVAILABILITY_ZONE",  limit: 100
    t.string "SUBNET_ID",          limit: 30
    t.string "INSTANCE_ID",        limit: 20
    t.string "STATUS",             limit: 20
    t.string "DNS_NAME",           limit: 100
    t.string "PRIVATE_DNS_NAME",   limit: 100
    t.string "IP_ADDRESS",         limit: 100
    t.string "PRIVATE_IP_ADDRESS", limit: 100
  end

  create_table "AWS_LOAD_BALANCER", primary_key: "LOAD_BALANCER_NO", force: true do |t|
    t.string "NAME",              limit: 30,  null: false
    t.string "DNS_NAME",          limit: 100
    t.string "SUBNET_ID",         limit: 100
    t.string "SECURITY_GROUPS",   limit: 100
    t.string "AVAILABILITY_ZONE", limit: 100
    t.string "HOSTID",            limit: 20
    t.string "STATUS",            limit: 20
  end

  create_table "AWS_SNAPSHOT", primary_key: "SNAPSHOT_NO", force: true do |t|
    t.integer  "FARM_NO",     limit: 8,  null: false
    t.integer  "PLATFORM_NO", limit: 8,  null: false
    t.integer  "VOLUME_NO",   limit: 8
    t.string   "SNAPSHOT_ID", limit: 20
    t.datetime "CREATE_DATE"
  end

  add_index "AWS_SNAPSHOT", ["FARM_NO"], name: "AWS_SNAPSHOT_FK1", using: :btree
  add_index "AWS_SNAPSHOT", ["PLATFORM_NO"], name: "AWS_SNAPSHOT_FK3", using: :btree
  add_index "AWS_SNAPSHOT", ["VOLUME_NO"], name: "AWS_SNAPSHOT_FK2", using: :btree

  create_table "AWS_SSL_KEY", primary_key: "KEY_NO", force: true do |t|
    t.string  "KEY_NAME",         limit: 100, null: false
    t.string  "SSLCERTIFICATEID", limit: 100, null: false
    t.integer "FARM_NO",          limit: 8,   null: false
    t.integer "PLATFORM_NO",      limit: 8,   null: false
  end

  create_table "AWS_VOLUME", primary_key: "VOLUME_NO", force: true do |t|
    t.integer "FARM_NO",           limit: 8,   null: false
    t.string  "VOLUME_NAME",       limit: 30,  null: false
    t.integer "PLATFORM_NO",       limit: 8,   null: false
    t.integer "COMPONENT_NO",      limit: 8
    t.integer "INSTANCE_NO",       limit: 8
    t.integer "SIZE"
    t.string  "SNAPSHOT_ID",       limit: 20
    t.string  "AVAILABILITY_ZONE", limit: 100
    t.string  "DEVICE",            limit: 20
    t.string  "VOLUME_ID",         limit: 20
    t.string  "STATUS",            limit: 20
    t.string  "INSTANCE_ID",       limit: 20
  end

  add_index "AWS_VOLUME", ["COMPONENT_NO", "INSTANCE_NO"], name: "AWS_VOLUME_UK1", unique: true, using: :btree
  add_index "AWS_VOLUME", ["FARM_NO"], name: "AWS_VOLUME_FK1", using: :btree
  add_index "AWS_VOLUME", ["INSTANCE_NO"], name: "AWS_VOLUME_FK3", using: :btree
  add_index "AWS_VOLUME", ["PLATFORM_NO"], name: "AWS_VOLUME_FK4", using: :btree

  create_table "CLOUDSTACK_ADDRESS", primary_key: "ADDRESS_NO", force: true do |t|
    t.integer "ACCOUNT",     limit: 8,   null: false
    t.integer "PLATFORM_NO", limit: 8,   null: false
    t.integer "INSTANCE_NO", limit: 8
    t.string  "INSTANCE_ID", limit: 20
    t.string  "ADDRESS_ID",  limit: 20
    t.string  "IPADDRESS",   limit: 100
    t.string  "NETWORKID",   limit: 20
    t.string  "STATE",       limit: 20
    t.string  "ZONEID",      limit: 100
  end

  add_index "CLOUDSTACK_ADDRESS", ["ACCOUNT"], name: "CLOUDSTACK_ADDRESS_FK1", using: :btree
  add_index "CLOUDSTACK_ADDRESS", ["INSTANCE_NO"], name: "CLOUDSTACK_ADDRESS_FK2", using: :btree
  add_index "CLOUDSTACK_ADDRESS", ["PLATFORM_NO"], name: "CLOUDSTACK_ADDRESS_FK3", using: :btree

  create_table "CLOUDSTACK_CERTIFICATE", id: false, force: true do |t|
    t.integer "ACCOUNT",               limit: 8,   null: false
    t.integer "PLATFORM_NO",           limit: 8,   null: false
    t.string  "CLOUDSTACK_ACCESS_ID",  limit: 100, null: false
    t.string  "CLOUDSTACK_SECRET_KEY", limit: 100, null: false
    t.string  "DEF_KEYPAIR",           limit: 100
  end

  add_index "CLOUDSTACK_CERTIFICATE", ["PLATFORM_NO"], name: "CLOUDSTACK_CERTIFICATE_FK2", using: :btree

  create_table "CLOUDSTACK_INSTANCE", primary_key: "INSTANCE_NO", force: true do |t|
    t.string "KEY_NAME",      limit: 100
    t.string "INSTANCE_TYPE", limit: 20
    t.string "INSTANCE_ID",   limit: 20
    t.string "DISPLAYNAME",   limit: 100
    t.string "IPADDRESS",     limit: 100
    t.string "STATE",         limit: 20
    t.string "ZONEID",        limit: 100
    t.string "NETWORKID",     limit: 20
    t.string "SECURITYGROUP", limit: 100
  end

  create_table "CLOUDSTACK_LOAD_BALANCER", primary_key: "LOAD_BALANCER_NO", force: true do |t|
    t.string "LOAD_BALANCER_ID", limit: 20
    t.string "ALGORITHM",        limit: 100
    t.string "DESCRIPTION",      limit: 100
    t.string "NAME",             limit: 30,  null: false
    t.string "ADDRESS_ID",       limit: 20
    t.string "PUBLICIP",         limit: 100
    t.string "PUBLICPORT",       limit: 20
    t.string "PRIVATEPORT",      limit: 20
    t.string "STATE",            limit: 20
    t.string "ZONEID",           limit: 100
  end

  create_table "CLOUDSTACK_SNAPSHOT", primary_key: "SNAPSHOT_NO", force: true do |t|
    t.string  "SNAPSHOT_ID", limit: 20
    t.integer "FARM_NO",     limit: 8,  null: false
    t.integer "PLATFORM_NO", limit: 8,  null: false
    t.string  "CREATE_DATE", limit: 30
    t.string  "VOLUMEID",    limit: 20
  end

  add_index "CLOUDSTACK_SNAPSHOT", ["FARM_NO"], name: "CLOUDSTACK_SNAPSHOT_FK1", using: :btree
  add_index "CLOUDSTACK_SNAPSHOT", ["PLATFORM_NO"], name: "CLOUDSTACK_SNAPSHOT_FK2", using: :btree

  create_table "CLOUDSTACK_VOLUME", primary_key: "VOLUME_NO", force: true do |t|
    t.integer "FARM_NO",        limit: 8,   null: false
    t.integer "PLATFORM_NO",    limit: 8,   null: false
    t.integer "COMPONENT_NO",   limit: 8
    t.integer "INSTANCE_NO",    limit: 8
    t.string  "VOLUME_ID",      limit: 20
    t.string  "DEVICEID",       limit: 20
    t.string  "DISKOFFERINGID", limit: 20
    t.string  "NAME",           limit: 100
    t.integer "SIZE"
    t.string  "SNAPSHOTID",     limit: 20
    t.string  "STATE",          limit: 20
    t.string  "INSTANCE_ID",    limit: 20
    t.string  "ZONEID",         limit: 100
    t.string  "HYPERVISOR",     limit: 100
  end

  add_index "CLOUDSTACK_VOLUME", ["COMPONENT_NO", "INSTANCE_NO"], name: "CLOUDSTACK_VOLUME_UK1", unique: true, using: :btree
  add_index "CLOUDSTACK_VOLUME", ["FARM_NO"], name: "CLOUDSTACK_VOLUME_FK1", using: :btree
  add_index "CLOUDSTACK_VOLUME", ["INSTANCE_NO"], name: "CLOUDSTACK_VOLUME_FK3", using: :btree
  add_index "CLOUDSTACK_VOLUME", ["PLATFORM_NO"], name: "CLOUDSTACK_VOLUME_FK4", using: :btree

  create_table "COMPONENT", primary_key: "COMPONENT_NO", force: true do |t|
    t.integer "FARM_NO",           limit: 8,   null: false
    t.string  "COMPONENT_NAME",    limit: 100, null: false
    t.integer "COMPONENT_TYPE_NO", limit: 8,   null: false
    t.string  "COMMENT",           limit: 100
    t.boolean "LOAD_BALANCER"
  end

  add_index "COMPONENT", ["COMPONENT_TYPE_NO"], name: "COMPONENT_FK2", using: :btree
  add_index "COMPONENT", ["FARM_NO", "COMPONENT_NAME"], name: "COMPONENT_UK1", unique: true, using: :btree

  create_table "COMPONENT_CONFIG", primary_key: "CONFIG_NO", force: true do |t|
    t.integer "COMPONENT_NO", limit: 8,   null: false
    t.string  "CONFIG_NAME",  limit: 50,  null: false
    t.string  "CONFIG_VALUE", limit: 200
  end

  add_index "COMPONENT_CONFIG", ["COMPONENT_NO", "CONFIG_NAME"], name: "COMPONENT_CONFIG_UK1", unique: true, using: :btree

  create_table "COMPONENT_INSTANCE", id: false, force: true do |t|
    t.integer "COMPONENT_NO", limit: 8,  null: false
    t.integer "INSTANCE_NO",  limit: 8,  null: false
    t.boolean "ASSOCIATE"
    t.boolean "ENABLED"
    t.string  "STATUS",       limit: 20
    t.boolean "CONFIGURE"
  end

  add_index "COMPONENT_INSTANCE", ["INSTANCE_NO"], name: "COMPONENT_INSTANCE_FK2", using: :btree

  create_table "COMPONENT_LOAD_BALANCER", primary_key: "LOAD_BALANCER_NO", force: true do |t|
    t.integer "COMPONENT_NO", limit: 8, null: false
  end

  add_index "COMPONENT_LOAD_BALANCER", ["COMPONENT_NO"], name: "COMPONENT_LOAD_BALANCER_FK2", using: :btree

  create_table "COMPONENT_TYPE", primary_key: "COMPONENT_TYPE_NO", force: true do |t|
    t.string  "COMPONENT_TYPE_NAME",      limit: 100, null: false
    t.string  "COMPONENT_TYPE_NAME_DISP", limit: 300, null: false
    t.string  "LAYER",                    limit: 100, null: false
    t.string  "LAYER_DISP",               limit: 300, null: false
    t.integer "RUN_ORDER",                            null: false
    t.boolean "SELECTABLE",                           null: false
    t.string  "ZABBIX_TEMPLATE",          limit: 100
    t.string  "ADDRESS_URL",              limit: 100
  end

  add_index "COMPONENT_TYPE", ["COMPONENT_TYPE_NAME"], name: "COMPONENT_TYPE_UK1", unique: true, using: :btree

  create_table "FARM", primary_key: "FARM_NO", force: true do |t|
    t.integer "USER_NO",              limit: 8,   null: false
    t.string  "FARM_NAME",            limit: 30,  null: false
    t.string  "COMMENT",              limit: 100
    t.string  "DOMAIN_NAME",          limit: 100
    t.boolean "SCHEDULED"
    t.boolean "COMPONENT_PROCESSING"
  end

  add_index "FARM", ["FARM_NAME"], name: "FARM_UK1", unique: true, using: :btree
  add_index "FARM", ["USER_NO"], name: "FARM_FK1", using: :btree

  create_table "IMAGE", primary_key: "IMAGE_NO", force: true do |t|
    t.integer "PLATFORM_NO",        limit: 8,   null: false
    t.string  "IMAGE_NAME",         limit: 100, null: false
    t.string  "IMAGE_NAME_DISP",    limit: 300, null: false
    t.string  "OS",                 limit: 100, null: false
    t.string  "OS_DISP",            limit: 300, null: false
    t.boolean "SELECTABLE",                     null: false
    t.string  "COMPONENT_TYPE_NOS", limit: 500, null: false
    t.string  "ZABBIX_TEMPLATE",    limit: 100
  end

  add_index "IMAGE", ["PLATFORM_NO", "IMAGE_NAME"], name: "IMAGE_UK1", unique: true, using: :btree

  create_table "IMAGE_AWS", primary_key: "IMAGE_NO", force: true do |t|
    t.string  "IMAGE_ID",       limit: 100, null: false
    t.string  "KERNEL_ID",      limit: 100
    t.string  "RAMDISK_ID",     limit: 100
    t.string  "INSTANCE_TYPES", limit: 500, null: false
    t.boolean "EBS_IMAGE",                  null: false
  end

  create_table "IMAGE_CLOUDSTACK", primary_key: "IMAGE_NO", force: true do |t|
    t.string "TEMPLATE_ID",    limit: 100, null: false
    t.string "INSTANCE_TYPES", limit: 500, null: false
  end

  create_table "IMAGE_NIFTY", primary_key: "IMAGE_NO", force: true do |t|
    t.string "IMAGE_ID",       limit: 100, null: false
    t.string "INSTANCE_TYPES", limit: 500, null: false
  end

  create_table "IMAGE_VMWARE", primary_key: "IMAGE_NO", force: true do |t|
    t.string "TEMPLATE_NAME",  limit: 100, null: false
    t.string "INSTANCE_TYPES", limit: 500, null: false
  end

  create_table "INSTANCE", primary_key: "INSTANCE_NO", force: true do |t|
    t.integer "FARM_NO",          limit: 8,   null: false
    t.string  "INSTANCE_NAME",    limit: 30,  null: false
    t.integer "PLATFORM_NO",      limit: 8,   null: false
    t.integer "IMAGE_NO",         limit: 8,   null: false
    t.boolean "ENABLED"
    t.string  "COMMENT",          limit: 100
    t.string  "FQDN",             limit: 100
    t.string  "INSTANCE_CODE",    limit: 30
    t.string  "PUBLIC_IP",        limit: 100
    t.string  "PRIVATE_IP",       limit: 100
    t.string  "STATUS",           limit: 20
    t.integer "PROGRESS"
    t.string  "COODINATE_STATUS", limit: 20
    t.boolean "LOAD_BALANCER"
  end

  add_index "INSTANCE", ["FARM_NO", "INSTANCE_NAME"], name: "INSTANCE_UK1", unique: true, using: :btree
  add_index "INSTANCE", ["IMAGE_NO"], name: "INSTANCE_FK3", using: :btree
  add_index "INSTANCE", ["PLATFORM_NO"], name: "INSTANCE_FK2", using: :btree

  create_table "INSTANCE_CONFIG", primary_key: "CONFIG_NO", force: true do |t|
    t.integer "INSTANCE_NO",  limit: 8,   null: false
    t.integer "COMPONENT_NO", limit: 8,   null: false
    t.string  "CONFIG_NAME",  limit: 50,  null: false
    t.string  "CONFIG_VALUE", limit: 200
  end

  add_index "INSTANCE_CONFIG", ["COMPONENT_NO"], name: "INSTANCE_CONFIG_FK2", using: :btree
  add_index "INSTANCE_CONFIG", ["INSTANCE_NO", "COMPONENT_NO", "CONFIG_NAME"], name: "INSTANCE_CONFIG_UK1", unique: true, using: :btree

  create_table "LOAD_BALANCER", primary_key: "LOAD_BALANCER_NO", force: true do |t|
    t.integer "FARM_NO",            limit: 8,   null: false
    t.string  "LOAD_BALANCER_NAME", limit: 30,  null: false
    t.string  "COMMENT",            limit: 100
    t.string  "FQDN",               limit: 100
    t.integer "PLATFORM_NO",        limit: 8,   null: false
    t.string  "TYPE",               limit: 20
    t.boolean "ENABLED"
    t.string  "STATUS",             limit: 20
    t.integer "COMPONENT_NO",       limit: 8,   null: false
    t.string  "CANONICAL_NAME",     limit: 100
    t.boolean "CONFIGURE"
  end

  add_index "LOAD_BALANCER", ["COMPONENT_NO"], name: "LOAD_BALANCER_FK2", using: :btree
  add_index "LOAD_BALANCER", ["FARM_NO", "LOAD_BALANCER_NAME"], name: "LOAD_BALANCER_UK1", unique: true, using: :btree
  add_index "LOAD_BALANCER", ["PLATFORM_NO"], name: "LOAD_BALANCER_FK3", using: :btree

  create_table "LOAD_BALANCER_HEALTH_CHECK", primary_key: "LOAD_BALANCER_NO", force: true do |t|
    t.string  "CHECK_PROTOCOL",      limit: 20
    t.integer "CHECK_PORT"
    t.string  "CHECK_PATH",          limit: 100
    t.integer "CHECK_TIMEOUT"
    t.integer "CHECK_INTERVAL"
    t.integer "HEALTHY_THRESHOLD"
    t.integer "UNHEALTHY_THRESHOLD"
  end

  create_table "LOAD_BALANCER_INSTANCE", id: false, force: true do |t|
    t.integer "LOAD_BALANCER_NO", limit: 8,  null: false
    t.integer "INSTANCE_NO",      limit: 8,  null: false
    t.boolean "ENABLED"
    t.string  "STATUS",           limit: 20
  end

  add_index "LOAD_BALANCER_INSTANCE", ["INSTANCE_NO"], name: "LOAD_BALANCER_INSTANCE_FK2", using: :btree

  create_table "LOAD_BALANCER_LISTENER", id: false, force: true do |t|
    t.integer "LOAD_BALANCER_NO",   limit: 8,  null: false
    t.integer "LOAD_BALANCER_PORT",            null: false
    t.integer "SERVICE_PORT",                  null: false
    t.string  "PROTOCOL",           limit: 20, null: false
    t.integer "SSL_KEY_NO",         limit: 8
    t.boolean "ENABLED"
    t.string  "STATUS",             limit: 20
    t.boolean "CONFIGURE"
  end

  create_table "NIFTY_CERTIFICATE", id: false, force: true do |t|
    t.integer "USER_NO",     limit: 8,     null: false
    t.integer "PLATFORM_NO", limit: 8,     null: false
    t.string  "CERTIFICATE", limit: 10240, null: false
    t.string  "PRIVATE_KEY", limit: 10240, null: false
  end

  add_index "NIFTY_CERTIFICATE", ["PLATFORM_NO"], name: "NIFTY_CERTIFICATE_FK2", using: :btree

  create_table "NIFTY_INSTANCE", primary_key: "INSTANCE_NO", force: true do |t|
    t.integer "KEY_PAIR_NO",        limit: 8
    t.string  "INSTANCE_TYPE",      limit: 20
    t.string  "INSTANCE_ID",        limit: 20
    t.string  "STATUS",             limit: 20
    t.string  "DNS_NAME",           limit: 100
    t.string  "PRIVATE_DNS_NAME",   limit: 100
    t.string  "IP_ADDRESS",         limit: 100
    t.string  "PRIVATE_IP_ADDRESS", limit: 100
    t.boolean "INITIALIZED"
  end

  add_index "NIFTY_INSTANCE", ["KEY_PAIR_NO"], name: "NIFTY_INSTANCE_FK2", using: :btree

  create_table "NIFTY_KEY_PAIR", primary_key: "KEY_NO", force: true do |t|
    t.integer "USER_NO",     limit: 8,     null: false
    t.integer "PLATFORM_NO", limit: 8,     null: false
    t.string  "KEY_NAME",    limit: 100,   null: false
    t.string  "PRIVATE_KEY", limit: 10240, null: false
    t.string  "PASSPHRASE",  limit: 100
  end

  add_index "NIFTY_KEY_PAIR", ["PLATFORM_NO"], name: "NIFTY_KEY_PAIR_FK2", using: :btree
  add_index "NIFTY_KEY_PAIR", ["USER_NO", "PLATFORM_NO", "KEY_NAME"], name: "NIFTY_KEY_PAIR_UK1", unique: true, using: :btree

  create_table "PCC_SYSTEM_INFO", id: false, force: true do |t|
    t.string "SECRET_KEY", limit: 16, null: false
  end

  add_index "PCC_SYSTEM_INFO", ["SECRET_KEY"], name: "PCC_SYSTEM_INFO_UK1", unique: true, using: :btree

  create_table "PLATFORM", primary_key: "PLATFORM_NO", force: true do |t|
    t.string  "PLATFORM_NAME",            limit: 100, null: false
    t.string  "PLATFORM_NAME_DISP",       limit: 300, null: false
    t.string  "PLATFORM_SIMPLENAME_DISP", limit: 200, null: false
    t.boolean "INTERNAL",                             null: false
    t.boolean "PROXY",                                null: false
    t.string  "PLATFORM_TYPE",            limit: 100, null: false
    t.boolean "SELECTABLE",                           null: false
  end

  add_index "PLATFORM", ["PLATFORM_NAME"], name: "PLATFORM_UK1", unique: true, using: :btree

  create_table "PLATFORM_AWS", primary_key: "PLATFORM_NO", force: true do |t|
    t.string  "HOST",              limit: 500, null: false
    t.integer "PORT",                          null: false
    t.boolean "SECURE",                        null: false
    t.boolean "EUCA",                          null: false
    t.boolean "VPC",                           null: false
    t.string  "REGION",            limit: 50
    t.string  "AVAILABILITY_ZONE", limit: 300
    t.string  "VPC_ID",            limit: 30
  end

  create_table "PLATFORM_CLOUDSTACK", primary_key: "PLATFORM_NO", force: true do |t|
    t.string  "HOST",        limit: 300, null: false
    t.string  "PATH",        limit: 500, null: false
    t.integer "PORT",                    null: false
    t.boolean "SECURE",                  null: false
    t.string  "ZONE_ID",     limit: 100, null: false
    t.string  "NETWORK_ID",  limit: 500, null: false
    t.integer "TIMEOUT",                 null: false
    t.string  "DEVICE_TYPE", limit: 20,  null: false
    t.string  "HOST_ID",     limit: 200
  end

  create_table "PLATFORM_NIFTY", primary_key: "PLATFORM_NO", force: true do |t|
    t.string "WSDL", limit: 300, null: false
  end

  create_table "PLATFORM_VMWARE", primary_key: "PLATFORM_NO", force: true do |t|
    t.string "URL",              limit: 500, null: false
    t.string "USERNAME",         limit: 100, null: false
    t.string "PASSWORD",         limit: 100, null: false
    t.string "DATACENTER",       limit: 300, null: false
    t.string "PUBLIC_NETWORK",   limit: 300, null: false
    t.string "PRIVATE_NETWORK",  limit: 300, null: false
    t.string "COMPUTE_RESOURCE", limit: 300, null: false
  end

  create_table "PLATFORM_VMWARE_INSTANCE_TYPE", primary_key: "INSTANCE_TYPE_NO", force: true do |t|
    t.integer "PLATFORM_NO",        limit: 8,   null: false
    t.string  "INSTANCE_TYPE_NAME", limit: 100, null: false
    t.integer "CPU",                            null: false
    t.integer "MEMORY",             limit: 8,   null: false
  end

  add_index "PLATFORM_VMWARE_INSTANCE_TYPE", ["PLATFORM_NO", "INSTANCE_TYPE_NAME"], name: "PLATFORM_VMWARE_INSTANCE_TYPE_UK1", unique: true, using: :btree

  create_table "PROXY", id: false, force: true do |t|
    t.string  "HOST",     limit: 500, null: false
    t.integer "PORT",                 null: false
    t.string  "USER",     limit: 100
    t.string  "PASSWORD", limit: 100
  end

  create_table "PUPPET_INSTANCE", primary_key: "INSTANCE_NO", force: true do |t|
    t.string "PASSWORD", limit: 50
  end

  create_table "TEMPLATE", primary_key: "TEMPLATE_NO", force: true do |t|
    t.string "TEMPLATE_NAME",             limit: 50,  null: false
    t.string "TEMPLATE_NAME_DISP",        limit: 300, null: false
    t.string "TEMPLATE_DESCRIPTION_DISP", limit: 500, null: false
  end

  add_index "TEMPLATE", ["TEMPLATE_NAME"], name: "TEMPLATE_UK1", unique: true, using: :btree

  create_table "TEMPLATE_COMPONENT", primary_key: "TEMPLATE_COMPONENT_NO", force: true do |t|
    t.string  "TEMPLATE_COMPONENT_NAME", limit: 50,   null: false
    t.integer "TEMPLATE_NO",             limit: 8,    null: false
    t.integer "COMPONENT_TYPE_NO",       limit: 8,    null: false
    t.string  "COMMENT",                 limit: 100
    t.integer "DISK_SIZE",                            null: false
    t.string  "ASSOCIATE",               limit: 1000
  end

  add_index "TEMPLATE_COMPONENT", ["COMPONENT_TYPE_NO"], name: "TEMPLATE_COMPONENT_FK1", using: :btree
  add_index "TEMPLATE_COMPONENT", ["TEMPLATE_NO", "TEMPLATE_COMPONENT_NAME"], name: "TEMPLATE_COMPONENT_UK1", unique: true, using: :btree

  create_table "TEMPLATE_INSTANCE", primary_key: "TEMPLATE_INSTANCE_NO", force: true do |t|
    t.string  "TEMPLATE_INSTANCE_NAME", limit: 50,  null: false
    t.integer "TEMPLATE_NO",            limit: 8,   null: false
    t.integer "PLATFORM_NO",            limit: 8,   null: false
    t.integer "IMAGE_NO",               limit: 8,   null: false
    t.string  "COMMENT",                limit: 100
    t.string  "INSTANCE_TYPE",          limit: 100, null: false
  end

  add_index "TEMPLATE_INSTANCE", ["IMAGE_NO"], name: "TEMPLATE_INSTANCE_FK3", using: :btree
  add_index "TEMPLATE_INSTANCE", ["PLATFORM_NO"], name: "TEMPLATE_INSTANCE_FK2", using: :btree
  add_index "TEMPLATE_INSTANCE", ["TEMPLATE_NO", "TEMPLATE_INSTANCE_NAME"], name: "TEMPLATE_INSTANCE_UK1", unique: true, using: :btree

  create_table "USER", primary_key: "USER_NO", force: true do |t|
    t.string  "USERNAME",    limit: 50
    t.string  "PASSWORD",    limit: 50
    t.integer "MASTER_USER", limit: 8
    t.boolean "POWER_USER"
  end

  add_index "USER", ["USERNAME"], name: "USER_UK1", unique: true, using: :btree

  create_table "USER_AUTH", id: false, force: true do |t|
    t.integer "FARM_NO",         limit: 8, default: 0, null: false
    t.integer "USER_NO",         limit: 8, default: 0, null: false
    t.boolean "FARM_USE"
    t.boolean "SERVER_MAKE"
    t.boolean "SERVER_DELETE"
    t.boolean "SERVER_OPERATE"
    t.boolean "SERVICE_MAKE"
    t.boolean "SERVICE_DELETE"
    t.boolean "SERVICE_OPERATE"
    t.boolean "LB_MAKE"
    t.boolean "LB_DELETE"
    t.boolean "LB_OPERATE"
  end

  create_table "VMWARE_ADDRESS", primary_key: "ADDRESS_NO", force: true do |t|
    t.integer "PLATFORM_NO",     limit: 8,   null: false
    t.string  "IP_ADDRESS",      limit: 100
    t.string  "SUBNET_MASK",     limit: 100
    t.string  "DEFAULT_GATEWAY", limit: 100
    t.integer "USER_NO",         limit: 8
    t.integer "INSTANCE_NO",     limit: 8
    t.boolean "ENABLED"
    t.boolean "ASSOCIATED"
  end

  add_index "VMWARE_ADDRESS", ["INSTANCE_NO"], name: "VMWARE_ADDRESS_UK1", unique: true, using: :btree
  add_index "VMWARE_ADDRESS", ["PLATFORM_NO"], name: "VMWARE_ADDRESS_FK3", using: :btree
  add_index "VMWARE_ADDRESS", ["USER_NO"], name: "VMWARE_ADDRESS_FK1", using: :btree

  create_table "VMWARE_DISK", primary_key: "DISK_NO", force: true do |t|
    t.integer "FARM_NO",      limit: 8,   null: false
    t.integer "PLATFORM_NO",  limit: 8,   null: false
    t.integer "COMPONENT_NO", limit: 8
    t.integer "INSTANCE_NO",  limit: 8
    t.integer "SIZE"
    t.integer "SCSI_ID"
    t.boolean "ATTACHED"
    t.string  "DATASTORE",    limit: 100
    t.string  "FILE_NAME",    limit: 200
  end

  add_index "VMWARE_DISK", ["COMPONENT_NO", "INSTANCE_NO"], name: "VMWARE_DISK_UK1", unique: true, using: :btree
  add_index "VMWARE_DISK", ["FARM_NO"], name: "VMWARE_DISK_FK1", using: :btree
  add_index "VMWARE_DISK", ["INSTANCE_NO"], name: "VMWARE_DISK_FK3", using: :btree
  add_index "VMWARE_DISK", ["PLATFORM_NO"], name: "VMWARE_DISK_FK4", using: :btree

  create_table "VMWARE_INSTANCE", primary_key: "INSTANCE_NO", force: true do |t|
    t.string  "MACHINE_NAME",       limit: 100
    t.string  "INSTANCE_TYPE",      limit: 30
    t.string  "COMPUTE_RESOURCE",   limit: 100
    t.string  "RESOURCE_POOL",      limit: 100
    t.string  "DATASTORE",          limit: 100
    t.integer "KEY_PAIR_NO",        limit: 8
    t.string  "IP_ADDRESS",         limit: 100
    t.string  "PRIVATE_IP_ADDRESS", limit: 100
  end

  add_index "VMWARE_INSTANCE", ["KEY_PAIR_NO"], name: "VMWARE_INSTANCE_FK2", using: :btree

  create_table "VMWARE_KEY_PAIR", primary_key: "KEY_NO", force: true do |t|
    t.integer "USER_NO",     limit: 8,    null: false
    t.integer "PLATFORM_NO", limit: 8,    null: false
    t.string  "KEY_NAME",    limit: 100,  null: false
    t.string  "KEY_PUBLIC",  limit: 1000
  end

  add_index "VMWARE_KEY_PAIR", ["PLATFORM_NO"], name: "VMWARE_KEY_PAIR_FK2", using: :btree
  add_index "VMWARE_KEY_PAIR", ["USER_NO", "PLATFORM_NO", "KEY_NAME"], name: "VMWARE_KEY_PAIR_UK1", unique: true, using: :btree

  create_table "VMWARE_NETWORK", primary_key: "NETWORK_NO", force: true do |t|
    t.string  "NETWORK_NAME",   limit: 100, null: false
    t.integer "PLATFORM_NO",    limit: 8,   null: false
    t.integer "VLAN_ID"
    t.string  "VSWITCH_NAME",   limit: 100
    t.integer "FARM_NO",        limit: 8
    t.boolean "PUBLIC_NETWORK",             null: false
  end

  add_index "VMWARE_NETWORK", ["FARM_NO"], name: "VMWARE_NETWORK_FK1", using: :btree
  add_index "VMWARE_NETWORK", ["PLATFORM_NO", "NETWORK_NAME"], name: "VMWARE_NETWORK_UK1", unique: true, using: :btree

  create_table "ZABBIX_DATA", primary_key: "INSTANCE_NO", force: true do |t|
    t.string  "HOSTID",         limit: 20
    t.integer "IDLE_TIME",      limit: 8,  null: false
    t.integer "FIRST_CLOCK",    limit: 8,  null: false
    t.integer "LAST_CLOCK",     limit: 8,  null: false
    t.integer "CONTINUE_CLOCK", limit: 8,  null: false
    t.integer "ALART",          limit: 8,  null: false
  end

  create_table "ZABBIX_INSTANCE", primary_key: "INSTANCE_NO", force: true do |t|
    t.string "HOSTID", limit: 20
    t.string "STATUS", limit: 20
  end

end
