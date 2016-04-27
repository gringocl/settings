require 'pathname'
require 'json'

require 'telemetry/logger'
require 'casing'
require 'attribute'
require 'dependency'; Dependency.activate
require 'confstruct'

require 'settings/data_source/data_source'
require 'settings/data_source/hash'
require 'settings/data_source/file'
require 'settings/data_source/build'
require 'settings/registry'
require 'settings/settings'
require 'settings/activate'
require 'settings/setting/assignment'
require 'settings/setting/macro'
