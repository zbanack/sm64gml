function math_util_macros_init() {
	#macro Mat4			(array_create(16))
	#macro Mtx			(array_create(16))
	#macro Vec3			(array_create(3))
	#macro Vec3s		(array_create(3))
	#macro Vec3f		(array_create(3))
	#macro gVec3sZero	(array_create(3))
	#macro gVec3fZero	(array_create(3))

	#macro M00	0
	#macro M01	4
	#macro M02	8
	#macro M03	12
	#macro M10	1
	#macro M11	5
	#macro M12	9
	#macro M13	13
	#macro M20	2
	#macro M21	6
	#macro M22	10
	#macro M23	14
	#macro M30	3
	#macro M31	7
	#macro M32	11
	#macro M33	15

	boot("math_util_macros_init");
}

function approach_number(current, target, inc, dec) {
	if (current < target) {
		current += inc;
		if (current > target) {
		    current = target;
		}
	} else {
		current -= dec;
		if (current < target) {
		    current = target;
		}
	}
	return current;
}
	
	
/// <pygml?v=1.0&h=6c0292804>
/// @function	vec3f_get_dist_and_angle(from, to, Ptr.p_dist, Ptr.p_pitch, Ptr.p_yaw)
/// @desc		Take the vector starting at 'from' pointed at 'to' an
///					retrieve the length  of that vector, as well as the yaw and
///					pitch angles.  Basically it converts the direction to
///					spherical coordinates.
/// @param		{Vec3f}		from
/// @param		{Vec3f}		to
/// @param		{f32}		Ptr.p_dist
/// @param		{s16}		Ptr.p_pitch
/// @param		{s16}		Ptr.p_yaw
function vec3f_get_dist_and_angle(from, to, dist, pitch, yaw) {
    var _x = to[0] - from[0];
    var _y = to[1] - from[1];
    var _z = to[2] - from[2];

    dist = sqrt(_x * _x + _y * _y + _z * _z);
    pitch = atan2s(sqrt(_x * _x + _z * _z), _y);
    yaw = atan2s(_z, _x);

    Ptr.p_dist = dist;
    Ptr.p_pitch = pitch;
    Ptr.p_yaw = yaw;
}

	

function vec3f_set_dist_and_angle(from, to, dist, pitch, yaw) {
	var pdiv = pitch / 0x8000 * pi;
	var ydiv = yaw / 0x8000 * pi;
	to[@ 0] = from[0] + dist * cos(pdiv) * sin(ydiv);
	to[@ 1] = from[1] + dist * sin(pdiv)
	to[@ 2] = from[2] + dist * cos(pdiv) * cos(ydiv);
}
	

function vec3f_add(dest, a) {
	dest[@ 0] += a[0];
	dest[@ 1] += a[1];
	dest[@ 2] += a[2];
}
	

//function mtxf_identity(mtx) {
//
//	array_copy(mtx, 0, matrix_build_identity(), 0, 16);
//
//}

function mtxf_translate(dest, b) {
	array_copy(dest, 0, matrix_build_identity(), 0, 16);
	dest[@ M30] = b[0];
	dest[@ M31] = b[1];
	dest[@ M32] = b[2];
}

function mtxf_to_mtx(dest, src) {
	
	array_copy(dest, 0, src, 0, 16);
	
}
	
function mtxf_cylboard(dest, mtx, position, angle) {
		
	var val = angle / 0x8000 * pi;
	dest[@ M00] = cos(val);
	dest[@ M01] = sin(val);
	dest[@ M02] = 0;
	dest[@ M03] = 0;
		   
	dest[@ M10] = mtx[M10];
	dest[@ M11] = mtx[M11];
	dest[@ M12] = mtx[M12];
	dest[@ M13] = 0;
		   
	dest[@ M20] = 0;
	dest[@ M21] = 0;
	dest[@ M22] = 1;
	dest[@ M23] = 0;
		   
	dest[@ M30] = mtx[M00] * position[0] + mtx[M10] * position[1] + mtx[M20] * position[2] + mtx[M30];
	dest[@ M31] = mtx[M01] * position[0] + mtx[M11] * position[1] + mtx[M21] * position[2] + mtx[M31];
	dest[@ M32] = mtx[M02] * position[0] + mtx[M12] * position[1] + mtx[M22] * position[2] + mtx[M32];
	dest[@ M33] = 1;
}

function mtxf_rotate_xyz_and_translate(dest, b, c) {
		
	var val0, val1, val2;
	val0 = c[0] / 0x8000 * pi;
	val1 = c[1] / 0x8000 * pi;
	val2 = c[2] / 0x8000 * pi;
		
	var sx = sin(val0);
	var cx = cos(val0);

	var sy = sin(val1);
	var cy = cos(val1);

	var sz = sin(val2);
	var cz = cos(val2);

	dest[@ M00] = cy * cz;
	dest[@ M01] = cy * sz;
	dest[@ M02] = -sy;
	dest[@ M03] = 0;
		   
	dest[@ M10] = sx * sy * cz - cx * sz;
	dest[@ M11] = sx * sy * sz + cx * cz;
	dest[@ M12] = sx * cy;
	dest[@ M13] = 0;
		   
	dest[@ M20] = cx * sy * cz + sx * sz;
	dest[@ M21] = cx * sy * sz - sx * cz;
	dest[@ M22] = cx * cy;
	dest[@ M23] = 0;
		   
	dest[@ M30] = b[0];
	dest[@ M31] = b[1];
	dest[@ M32] = b[2];
	dest[@ M33] = 1;
	
}

function mtxf_rotate_zxy_and_translate(dest, translate, rotate) {

	var sx = sins(rotate[0]);
	var cx = coss(rotate[0]);

	var sy = sins(rotate[1]);
	var cy = coss(rotate[1]);

	var sz = sins(rotate[2]);
	var cz = coss(rotate[2]);

	dest[@ M00] = cy * cz + sx * sy * sz;
	dest[@ M10] = -cy * sz + sx * sy * cz;
	dest[@ M20] = cx * sy;
	dest[@ M30] = translate[0];
		   
	dest[@ M01] = cx * sz;
	dest[@ M11] = cx * cz;
	dest[@ M21] = -sx;
	dest[@ M31] = translate[1];
		   
	dest[@ M02] = -sy * cz + sx * cy * sz;
	dest[@ M12] = sy * sz + sx * cy * cz;
	dest[@ M22] = cx * cy;
	dest[@ M32] = translate[2];
		   
	dest[@ M03] = 0.0;
	dest[@ M13] = 0.0;
	dest[@ M23] = 0.0;
	dest[@ M33] = 1.0;
}

function mtxf_rotate_xy(mtx, angle) {
	array_copy(mtx, 0, matrix_build_identity(), 0, 16);
	mtx[@ M00] = cos(angle);
	mtx[@ M01] = sin(angle);
	mtx[@ M10] = -mtx[M01];
	mtx[@ M11] = mtx[M00];
}

function mtxf_scale_vec3f(dest, mtx, s) {

	dest[@ M00] = mtx[M00] * s[0];
	dest[@ M10] = mtx[M10] * s[1];
	dest[@ M20] = mtx[M20] * s[2];
	dest[@ M30] = mtx[M30];
					
	dest[@ M01] = mtx[M01] * s[0];
	dest[@ M11] = mtx[M11] * s[1];
	dest[@ M21] = mtx[M21] * s[2];
	dest[@ M31] = mtx[M31];
					
	dest[@ M02] = mtx[M02] * s[0];
	dest[@ M12] = mtx[M12] * s[1];
	dest[@ M22] = mtx[M22] * s[2];
	dest[@ M32] = mtx[M32];
					 
	dest[@ M03] = mtx[M03] * s[0];
	dest[@ M13] = mtx[M13] * s[1];
	dest[@ M23] = mtx[M23] * s[2];
	dest[@ M33] = mtx[M33];
			
}

function mtxf_mul(dest, a, b) {
	array_copy(dest, 0, matrix_multiply(b, a), 0, 16);
}

function mtxf_lookat(mtx, from, to, roll) {

	var invLength, dx, dz, xColY, yColY, zColY, xColZ, yColZ, zColZ, xColX, yColX, zColX;

	dx = to[0] - from[0];
	dz = to[2] - from[2];

	invLength = -1.0 / sqrt((dx * dx + dz * dz));
	dx *= invLength;
	dz *= invLength;

	yColY = cos(roll);
	xColY = sin(roll) * dz;
	zColY = -sin(roll) * dx;

	xColZ = to[0] - from[0];
	yColZ = to[1] - from[1];
	zColZ = to[2] - from[2];

	invLength = -1.0 / sqrt((xColZ * xColZ + yColZ * yColZ + zColZ * zColZ));
	xColZ *= invLength;
	yColZ *= invLength;
	zColZ *= invLength;

	xColX = yColY * zColZ - zColY * yColZ;
	yColX = zColY * xColZ - xColY * zColZ;
	zColX = xColY * yColZ - yColY * xColZ;

	invLength = 1.0 / sqrt((xColX * xColX + yColX * yColX + zColX * zColX));

	xColX *= invLength;
	yColX *= invLength;
	zColX *= invLength;

	xColY = yColZ * zColX - zColZ * yColX;
	yColY = zColZ * xColX - xColZ * zColX;
	zColY = xColZ * yColX - yColZ * xColX;

	invLength = 1.0 / sqrt((xColY * xColY + yColY * yColY + zColY * zColY));
	xColY *= invLength;
	yColY *= invLength;
	zColY *= invLength;

	mtx[@ M00] = xColX;
	mtx[@ M10] = yColX;
	mtx[@ M20] = zColX;
	mtx[@ M30] = -(from[0] * xColX + from[1] * yColX + from[2] * zColX);
		  
	mtx[@ M01] = xColY;
	mtx[@ M11] = yColY;
	mtx[@ M21] = zColY;
	mtx[@ M31] = -(from[0] * xColY + from[1] * yColY + from[2] * zColY);
		  
	mtx[@ M02] = xColZ;
	mtx[@ M12] = yColZ;
	mtx[@ M22] = zColZ;
	mtx[@ M32] = -(from[0] * xColZ + from[1] * yColZ + from[2] * zColZ);
		  
	mtx[@ M03] = 0;
	mtx[@ M13] = 0;
	mtx[@ M23] = 0;
	mtx[@ M33] = 1;


}

function guPerspective(m, perspNorm, fovy, aspect, near, far, scale) {
	
	array_copy(m, 0, matrix_build_identity(), 0, 16);
	fovy *= pi / 180.0;
	var yscale = cos(fovy / 2) / sin(fovy / 2);

	m[@ M00] = yscale / aspect;
	m[@ M11] = yscale;
	m[@ M22] = (near + far) / (near - far);
	m[@ M23] = -1;
	m[@ M32] = 2 * near * far / (near - far);
	m[@ M33] = 0.0;
	
		
		
	m[@ M00] *= scale;
	m[@ M01] *= scale;
	m[@ M02] *= scale;
	m[@ M03] *= scale;
	m[@ M10] *= scale;
	m[@ M11] *= scale;
	m[@ M12] *= scale;
	m[@ M13] *= scale;
	m[@ M20] *= scale;
	m[@ M21] *= scale;
	m[@ M22] *= scale;
	m[@ M23] *= scale;
	m[@ M30] *= scale;
	m[@ M31] *= scale;
	m[@ M32] *= scale;
	m[@ M33] *= scale;

	if (perspNorm) {
		if (near + far <= 2.0) {
		    perspNorm.value = 65535;
		} else {
		    perspNorm.value = (1 << 17) / (near + far);
		    if (perspNorm.value <= 0) {
				perspNorm.value = 1;	
			}
		}
	}
}

/// <pygml?v=1.0&h=26989c9a2>
/// @function	guNormalize(Ptr.p_x, Ptr.p_y, Ptr.p_z)
/// @param		{f32}		Ptr.p_x
/// @param		{f32}		Ptr.p_y
/// @param		{f32}		Ptr.p_z
function guNormalize(_x, _y, _z) {
    var tmp = 1.0 / sqrt(_x * _x + _y * _y + _z * _z);
    _x = _x * tmp;
    _y = _y * tmp;
    _z = _z * tmp;

    Ptr.p_x = _x;

    Ptr.p_y = _y;

    Ptr.p_z = _z;
}


function guRotate(m, a, x, y, z) {
	var degreesToRadians = pi / 180

	guNormalize(x, y, z)
		
	x = Ptr.p_x;
	y = Ptr.p_y;
	z = Ptr.p_z;

	a *= degreesToRadians;

	var sin_a = sin(a);
	var cos_a = cos(a);

	var sp2c = x * y * (1 - cos_a);
	var sp28 = y * z * (1 - cos_a);
	var sp24 = z * x * (1 - cos_a);

	array_copy(m, 0, matrix_build_identity(), 0, 16);
	var xx = x * x;
	m[@ M00] = (1 - xx) * cos_a + xx;
	m[@ M21] = sp28 - x * sin_a;
	m[@ M12] = sp28 + x * sin_a;
	var yy = y * y;
	m[@ M11] = (1 - yy) * cos_a + yy;
	m[@ M20] = sp24 + y * sin_a;
	m[@ M02] = sp24 - y * sin_a;
	var zz = z * z;
	m[@ M22] = (1 - zz) * cos_a + zz;
	m[@ M10] = sp2c - z * sin_a;
	m[@ M01] = sp2c + z * sin_a;
}


function guTranslate(m, x, y, z) {
	array_copy(m, 0, matrix_build_identity(), 0, 16);
	m[@ M30] = x;
	m[@ M31] = y;
	m[@ M32] = z;
}

function guScale(m, x, y, z) {
	array_copy(m, 0, matrix_build_identity(), 0, 16);
	m[@ M00] = x;
	m[@ M11] = y;
	m[@ M22] = z;
	m[@ M33] = 1.0;
}

function guOrtho(m, left, right, bottom, top, near, far, scale) {
	array_copy(m, 0, matrix_build_identity(), 0, 16);
	m[@ M00] = 2 / (right - left);
	m[@ M11] = 2 / (top - bottom);
	m[@ M22] = -2 / (far - near);
	m[@ M30] = -(right + left) / (right - left);
	m[@ M31] = -(top + bottom) / (top - bottom);
	m[@ M32] = -(far + near) / (far - near);
	m[@ M33] = 1;

	m[@ M00] *= scale;
	m[@ M01] *= scale;
	m[@ M02] *= scale;
	m[@ M03] *= scale;
	m[@ M10] *= scale;
	m[@ M11] *= scale;
	m[@ M12] *= scale;
	m[@ M13] *= scale;
	m[@ M20] *= scale;
	m[@ M21] *= scale;
	m[@ M22] *= scale;
	m[@ M23] *= scale;
	m[@ M30] *= scale;
	m[@ M31] *= scale;
	m[@ M32] *= scale;
	m[@ M33] *= scale;
	
	
	//array_copy(m, 0, matrix_build_projection_ortho(right-left, bottom-top, near, far), 0, 16);
		
}		

/**
 * Set 'dest' to a transformation matrix that turns an object to face the camera.
 * 'mtx' is the look-at matrix from the camera
 * 'position' is the position of the object in the world
 * 'angle' rotates the object while still facing the camera.
 */
function mtxf_billboard(dest, mtx, position, angle) {
    dest[@ M00] = coss(angle);
    dest[@ M01] = sins(angle);
    dest[@ M02] = 0;
    dest[@ M03] = 0;

    dest[@ M10] = -dest[M01];
    dest[@ M11] = dest[M00];
    dest[@ M12] = 0;
    dest[@ M13] = 0;

    dest[@ M20] = 0;
    dest[@ M21] = 0;
    dest[@ M22] = 1;
    dest[@ M23] = 0;

    dest[@ M30] = mtx[M00] * position[0] + mtx[M10] * position[1] + mtx[M20] * position[2] + mtx[M30];
    dest[@ M31] = mtx[M01] * position[0] + mtx[M11] * position[1] + mtx[M21] * position[2] + mtx[M31];
    dest[@ M32] = mtx[M02] * position[0] + mtx[M12] * position[1] + mtx[M22] * position[2] + mtx[M32];
    dest[@ M33] = 1;
}

	
function atan2s(y, x) {

	return arctan2(x, y) * 10430.5;
		
}

/**
 * Set 'dest' to a transformation matrix that aligns an object with the terrain
 * based on the normal. Used for enemies.
 * 'upDir' is the terrain normal
 * 'yaw' is the angle which it should face
 * 'pos' is the object's position in the world
 */
function mtxf_align_terrain_normal(dest, upDir, pos, yaw) {
    var lateralDir = Vec3;
    var leftDir = Vec3;
    var forwardDir = Vec3;

    vec3f_set(lateralDir, sins(yaw), 0, coss(yaw));
    vec3f_normalize(upDir);

    vec3f_cross(leftDir, upDir, lateralDir);
    vec3f_normalize(leftDir);

    vec3f_cross(forwardDir, leftDir, upDir);
    vec3f_normalize(forwardDir);

    dest[@ M00] = leftDir[0];
    dest[@ M01] = leftDir[1];
    dest[@ M02] = leftDir[2];
    dest[@ M30] = pos[0];

    dest[@ M10] = upDir[0];
    dest[@ M11] = upDir[1];
    dest[@ M12] = upDir[2];
    dest[@ M31] = pos[1];

    dest[@ M20] = forwardDir[0];
    dest[@ M21] = forwardDir[1];
    dest[@ M22] = forwardDir[2];
    dest[@ M32] = pos[2];

    dest[@ M03] = 0.0;
    dest[@ M13] = 0.0;
    dest[@ M23] = 0.0;
    dest[@ M33] = 1.0;
}

function vec3f_set(dest, x, y, z) {
    dest[@ 0] = x;
    dest[@ 1] = y;
    dest[@ 2] = z;
    return dest;
}


function vec3s_set(dest, x, y, z) {
    dest[@ 0] = x;
    dest[@ 1] = y;
    dest[@ 2] = z;
    return dest;
}

function vec3f_normalize(dest) {
    //! Possible division by zero
    var invsqrt = 1.0 / sqrt(dest[0] * dest[0] + dest[1] * dest[1] + dest[2] * dest[2]);

    dest[@ 0] *= invsqrt;
    dest[@ 1] *= invsqrt;
    dest[@ 2] *= invsqrt;
    return dest;
}

/// Make vector 'dest' the cross product of vectors a and b.
function vec3f_cross(dest, a, b) {
    dest[@ 0] = a[1] * b[2] - b[1] * a[2];
    dest[@ 1] = a[2] * b[0] - b[2] * a[0];
    dest[@ 2] = a[0] * b[1] - b[0] * a[1];
    return dest;
}

function vec3f_copy(dest, src) {
	dest[@ 0] = src[0];
	dest[@ 1] = src[1];
	dest[@ 2] = src[2];
}

function vec3s_copy(dest, src) {
	dest[@ 0] = src[0];
	dest[@ 1] = src[1];
	dest[@ 2] = src[2];
}

function DEGREES(val) {
	return ((val) * 0x10000 / 360);
}
function vec3f_sub(dest, src) {
	dest[@ 0] -= src[0];
	dest[@ 1] -= src[1];
	dest[@ 2] -= src[2];
}

/// @description cam_convert_3d_to_2d(camera, x, y, z)
/// @param camera
/// @param x
/// @param y
/// @param z
/*
    Transforms a 3D coordinate to a 2D window-space coordinate. Returns an array of the following format:
    [x, y]
    Script created by TheSnidr
    www.thesnidr.com
*/
function cam_convert_3d_to_2d() {
	var camera = argument0;
	var _x = argument1;
	var _y = argument2;
	var _z = argument3;

	var V = camera_get_view_mat(camera);
	var P = camera_get_proj_mat(camera);


	var cx, cy;
	if (P[15] == 0)
	{    //This is a perspective projection
	    var w = V[2] * _x + V[6] * _y + V[10] * _z + V[14];
	    if w <= 0{return [-1, -1];}
	    cx = P[8] + P[0] * (V[0] * _x + V[4] * _y + V[8] * _z + V[12]) / w;
	    cy = P[9] + P[5] * (V[1] * _x + V[5] * _y + V[9] * _z + V[13]) / w;
	}
	else 
	{    //This is an ortho projection
	    cx = P[12] + P[0] * (V[0] * _x + V[4] * _y + V[8]  * _z + V[12]);
	    cy = P[13] + P[5] * (V[1] * _x + V[5] * _y + V[9]  * _z + V[13]);
	}
	return [(.5 + .5 * cx) * SCREEN_WIDTH, (.5 - .5 * cy) * SCREEN_HEIGHT];
}

function sins(val) {
	return sin(val / 0x8000 * pi);
}

function coss(val) {
	return cos(val / 0x8000 * pi);
}

/// <pygml?v=1.0&h=f523279a2>
/// <pygml?v=1.0&h=f13eb35de>
/// @function	approach_s32(current, target, inc, dec)
/// @desc		Return the value 'current' after it tries to approach
///					target, going up at  most 'inc' and going down at most
///					'dec'.
/// @param		{s32}		current
/// @param		{s32}		target
/// @param		{s32}		inc
/// @param		{s32}		dec
/// @returns	s32
function approach_s32(current, target, inc, dec) {
    //! If target is close to the max or min s32, then it's possible to overflow
    // past it without stopping.

    if (current < target) {
        current += inc;
        if (current > target) {
            current = target;
        }
    } else {
        current -= dec;
        if (current < target) {
            current = target;
        }
    }
    return current;
}

/// <pygml?v=1.0&h=250b8202e>
/// @function	approach_f32(current, target, inc, dec)
/// @desc		Return the value 'current' after it tries to approach
///					target, going up at  most 'inc' and going down at most
///					'dec'.
/// @param		{f32}		current
/// @param		{f32}		target
/// @param		{f32}		inc
/// @param		{f32}		dec
/// @returns	f32
function approach_f32(current, target, inc, dec) {
    if (current < target) {
        current += inc;
        if (current > target) {
            current = target;
        }
    } else {
        current -= dec;
        if (current < target) {
            current = target;
        }
    }
    return current;
}

/**
 * Set 'mtx' to a transformation matrix that aligns an object with the terrain
 * based on 3 height samples in an equilateral triangle around the object.
 * Used for Mario when crawling or sliding.
 * 'yaw' is the angle which it should face
 * 'pos' is the object's position in the world
 * 'radius' is the distance from each triangle vertex to the center
 */
function mtxf_align_terrain_triangle(mtx, pos, yaw, radius) {
    var sp74 = {};
    var point0	 = Vec3f; 
    var point1	 = Vec3f; 
    var point2	 = Vec3f; 
    var forward	 = Vec3f; 
    var xColumn	 = Vec3f; 
    var yColumn	 = Vec3f; 
    var zColumn	 = Vec3f; 
    var avgY;
    var minY = -radius * 3;

    point0[0] = pos[0] + radius * sins(yaw + 0x2AAA);
    point0[2] = pos[2] + radius * coss(yaw + 0x2AAA);
    point1[0] = pos[0] + radius * sins(yaw + 0x8000);
    point1[2] = pos[2] + radius * coss(yaw + 0x8000);
    point2[0] = pos[0] + radius * sins(yaw + 0xD555);
    point2[2] = pos[2] + radius * coss(yaw + 0xD555);

    point0[1] = find_floor(point0[0], pos[1] + 150, point0[2], sp74);
	sp74 = sp74._floor;
    point1[1] = find_floor(point1[0], pos[1] + 150, point1[2], sp74);
	sp74 = sp74._floor;
    point2[1] = find_floor(point2[0], pos[1] + 150, point2[2], sp74);
	sp74 = sp74._floor;

    if (point0[1] - pos[1] < minY) {
        point0[1] = pos[1];
    }

    if (point1[1] - pos[1] < minY) {
        point1[1] = pos[1];
    }

    if (point2[1] - pos[1] < minY) {
        point2[1] = pos[1];
    }

    avgY = (point0[1] + point1[1] + point2[1]) / 3;

    vec3f_set(forward, sins(yaw), 0, coss(yaw));
    find_vector_perpendicular_to_plane(yColumn, point0, point1, point2);
    vec3f_normalize(yColumn);
    vec3f_cross(xColumn, yColumn, forward);
    vec3f_normalize(xColumn);
    vec3f_cross(zColumn, xColumn, yColumn);
    vec3f_normalize(zColumn);

    mtx[@ M00] = xColumn[0];
    mtx[@ M01] = xColumn[1];
    mtx[@ M02] = xColumn[2];
    mtx[@ M30] = pos[0];
		
    mtx[@ M10] = yColumn[0];
    mtx[@ M11] = yColumn[1];
    mtx[@ M12] = yColumn[2];
    mtx[@ M31] = (avgY < pos[1]) ? pos[1] : avgY;
		
    mtx[@ M20] = zColumn[0];
    mtx[@ M21] = zColumn[1];
    mtx[@ M22] = zColumn[2];
    mtx[@ M32] = pos[2];
	
    mtx[@ M03] = 0;
    mtx[@ M13] = 0;
    mtx[@ M23] = 0;
    mtx[@ M33] = 1;
}

/**
 * Set 'dest' the normal vector of a triangle with vertices a, b and c.
 * It is similar to vec3f_cross, but it calculates the vectors (c-b) and (b-a)
 * at the same time.
 */
function find_vector_perpendicular_to_plane(dest, a, b, c) {
    dest[@ 0] = (b[1] - a[1]) * (c[2] - b[2]) - (c[1] - b[1]) * (b[2] - a[2]);
    dest[@ 1] = (b[2] - a[2]) * (c[0] - b[0]) - (c[2] - b[2]) * (b[0] - a[0]);
    dest[@ 2] = (b[0] - a[0]) * (c[1] - b[1]) - (c[0] - b[0]) * (b[1] - a[1]);
    return dest; //! warning: function returns address of local variable
}

function vec3s_to_vec3f(dest, a) {
    dest[@ 0] = a[0];
    dest[@ 1] = a[1];
    dest[@ 2] = a[2];
}

function yaw_wrap(val) {
    val = val > 32767 ? val - 65536 : val;
    val = val < -32768 ? val + 65536 : val;	
	return val;
}