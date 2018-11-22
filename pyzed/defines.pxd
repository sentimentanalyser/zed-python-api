########################################################################
#
# Copyright (c) 2017, STEREOLABS.
#
# All rights reserved.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
########################################################################

# File containing the Cython declarations to use the defines.hpp functions.

from libcpp.string cimport string
from libc.string cimport const_char
from libcpp.vector cimport vector
from libcpp.pair cimport pair
from libcpp cimport bool

cdef extern from "Utils.cpp" namespace "sl":
    string to_str(String sl_str)

cdef extern from "sl/types.hpp" namespace "sl":

    cdef cppclass String 'sl::String':
        String()
        String(const char *data)
        void set(const char *data)
        const char *get() const
        bool empty() const
        string std_str() const

    ctypedef enum UNIT:
        UNIT_MILLIMETER
        UNIT_CENTIMETER
        UNIT_METER
        UNIT_INCH
        UNIT_FOOT
        UNIT_LAST

    String toString(UNIT o)

    ctypedef enum COORDINATE_SYSTEM:
        COORDINATE_SYSTEM_IMAGE
        COORDINATE_SYSTEM_LEFT_HANDED_Y_UP
        COORDINATE_SYSTEM_RIGHT_HANDED_Y_UP
        COORDINATE_SYSTEM_RIGHT_HANDED_Z_UP
        COORDINATE_SYSTEM_LEFT_HANDED_Z_UP
        COORDINATE_SYSTEM_RIGHT_HANDED_Z_UP_X_FWD
        COORDINATE_SYSTEM_LAST

    String toString(COORDINATE_SYSTEM o)

cdef extern from "sl/defines.hpp" namespace "sl":

    ctypedef enum RESOLUTION:
        RESOLUTION_HD2K
        RESOLUTION_HD1080
        RESOLUTION_HD720
        RESOLUTION_VGA
        RESOLUTION_LAST

    String toString(RESOLUTION o)

    ctypedef enum CAMERA_SETTINGS:
        CAMERA_SETTINGS_BRIGHTNESS
        CAMERA_SETTINGS_CONTRAST
        CAMERA_SETTINGS_HUE
        CAMERA_SETTINGS_SATURATION
        CAMERA_SETTINGS_GAIN
        CAMERA_SETTINGS_EXPOSURE
        CAMERA_SETTINGS_WHITEBALANCE
        CAMERA_SETTINGS_AUTO_WHITEBALANCE
        CAMERA_SETTINGS_LAST

    String toString(CAMERA_SETTINGS o)

    ctypedef enum SELF_CALIBRATION_STATE:
        SELF_CALIBRATION_STATE_NOT_STARTED
        SELF_CALIBRATION_STATE_RUNNING
        SELF_CALIBRATION_STATE_FAILED
        SELF_CALIBRATION_STATE_SUCCESS
        SELF_CALIBRATION_STATE_LAST

    String toString(SELF_CALIBRATION_STATE o)

    ctypedef enum DEPTH_MODE:
        DEPTH_MODE_NONE
        DEPTH_MODE_PERFORMANCE
        DEPTH_MODE_MEDIUM
        DEPTH_MODE_QUALITY
        DEPTH_MODE_ULTRA
        DEPTH_MODE_LAST

    String toString(DEPTH_MODE o)

    ctypedef enum SENSING_MODE:
        SENSING_MODE_STANDARD
        SENSING_MODE_FILL
        SENSING_MODE_LAST

    String toString(SENSING_MODE o)

    ctypedef enum MEASURE:
        MEASURE_DISPARITY
        MEASURE_DEPTH
        MEASURE_CONFIDENCE
        MEASURE_XYZ
        MEASURE_XYZRGBA
        MEASURE_XYZBGRA
        MEASURE_XYZARGB
        MEASURE_XYZABGR
        MEASURE_NORMALS
        MEASURE_DISPARITY_RIGHT
        MEASURE_DEPTH_RIGHT
        MEASURE_XYZ_RIGHT
        MEASURE_XYZRGBA_RIGHT
        MEASURE_XYZBGRA_RIGHT
        MEASURE_XYZARGB_RIGHT
        MEASURE_XYZABGR_RIGHT
        MEASURE_NORMALS_RIGHT
        MEASURE_LAST

    String toString(MEASURE o)

    ctypedef enum VIEW:
        VIEW_LEFT
        VIEW_RIGHT
        VIEW_LEFT_GRAY
        VIEW_RIGHT_GRAY
        VIEW_LEFT_UNRECTIFIED
        VIEW_RIGHT_UNRECTIFIED
        VIEW_LEFT_UNRECTIFIED_GRAY
        VIEW_RIGHT_UNRECTIFIED_GRAY
        VIEW_SIDE_BY_SIDE
        VIEW_DEPTH
        VIEW_CONFIDENCE
        VIEW_NORMALS
        VIEW_DEPTH_RIGHT
        VIEW_NORMALS_RIGHT
        VIEW_LAST

    String toString(VIEW o)

    ctypedef enum TIME_REFERENCE:
        TIME_REFERENCE_IMAGE
        TIME_REFERENCE_CURRENT
        TIME_REFERENCE_LAST

    String toString(TIME_REFERENCE o)

    ctypedef enum DEPTH_FORMAT:
        DEPTH_FORMAT_PNG
        DEPTH_FORMAT_PFM
        DEPTH_FORMAT_PGM
        DEPTH_FORMAT_LAST

    String toString(DEPTH_FORMAT o)

    ctypedef enum POINT_CLOUD_FORMAT:
        POINT_CLOUD_FORMAT_XYZ_ASCII
        POINT_CLOUD_FORMAT_PCD_ASCII
        POINT_CLOUD_FORMAT_PLY_ASCII
        POINT_CLOUD_FORMAT_VTK_ASCII
        POINT_CLOUD_FORMAT_LAST

    String toString(POINT_CLOUD_FORMAT o)

    ctypedef enum TRACKING_STATE:
        TRACKING_STATE_SEARCHING
        TRACKING_STATE_OK
        TRACKING_STATE_OFF
        TRACKING_STATE_FPS_TOO_LOW
        TRACKING_STATE_LAST

    String toString(TRACKING_STATE o)

    ctypedef enum AREA_EXPORT_STATE:
        AREA_EXPORT_STATE_SUCCESS
        AREA_EXPORT_STATE_RUNNING
        AREA_EXPORT_STATE_NOT_STARTED
        AREA_EXPORT_STATE_FILE_EMPTY
        AREA_EXPORT_STATE_FILE_ERROR
        AREA_EXPORT_STATE_SPATIAL_MEMORY_DISABLED
        AREA_EXPORT_STATE_LAST

    String toString(AREA_EXPORT_STATE o)

    ctypedef enum REFERENCE_FRAME:
        REFERENCE_FRAME_WORLD
        REFERENCE_FRAME_CAMERA
        REFERENCE_FRAME_LAST

    String toString(REFERENCE_FRAME o)

    ctypedef enum SPATIAL_MAPPING_STATE:
        SPATIAL_MAPPING_STATE_INITIALIZING
        SPATIAL_MAPPING_STATE_OK
        SPATIAL_MAPPING_STATE_NOT_ENOUGH_MEMORY
        SPATIAL_MAPPING_STATE_NOT_ENABLED
        SPATIAL_MAPPING_STATE_FPS_TOO_LOW
        SPATIAL_MAPPING_STATE_LAST

    String toString(SPATIAL_MAPPING_STATE o)

    ctypedef enum SVO_COMPRESSION_MODE:
        SVO_COMPRESSION_MODE_RAW
        SVO_COMPRESSION_MODE_LOSSLESS
        SVO_COMPRESSION_MODE_LOSSY
        SVO_COMPRESSION_MODE_AVCHD
        SVO_COMPRESSION_MODE_HEVC
        SVO_COMPRESSION_MODE_LAST

    String toString(SVO_COMPRESSION_MODE o)

    cdef struct RecordingState:
        bool status
        double current_compression_time
        double current_compression_ratio
        double average_compression_time
        double average_compression_ratio


    @staticmethod
    cdef vector[pair[int, int]] cameraResolution

    @staticmethod
    cdef const_char* resolution2str(RESOLUTION res)

    @staticmethod
    cdef const_char* statusCode2str(SELF_CALIBRATION_STATE state)

    @staticmethod
    cdef DEPTH_MODE str2mode(const_char* mode)

    @staticmethod
    cdef const_char* depthMode2str(DEPTH_MODE mode)

    @staticmethod
    cdef const_char* sensingMode2str(SENSING_MODE mode)

    @staticmethod
    cdef const_char* unit2str(UNIT unit)

    @staticmethod
    cdef UNIT str2unit(const_char* unit)

    @staticmethod
    cdef const_char* trackingState2str(TRACKING_STATE state)

    @staticmethod
    cdef const_char* spatialMappingState2str(SPATIAL_MAPPING_STATE state)
