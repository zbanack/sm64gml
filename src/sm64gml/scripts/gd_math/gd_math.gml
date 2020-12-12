function gd_math_macros_init() {
	#macro GD_X_AXIS	(0) 
	#macro GD_Y_AXIS	(1)
	#macro GD_Z_AXIS	(2)

	#macro DEG_PER_RAD	(180.0 / pi)
	#macro RAD_PER_DEG	(pi / 180.0)	
	
	boot("gd_math_macros_init");
}

function gd_mat4f_lookat(mtx, xFrom, yFrom, zFrom, xTo, yTo, zTo, zColY, yColY, xColY) {

	var d = { x: 0.0, y: 0.0, z: 0.0 };
	var colX = { x: 0.0, y: 0.0, z: 0.0 };
	var norm = { x: 0.0, y: 0.0, z: 0.0 };

    // No reason to do this? mtx is set lower.
    gd_set_identity_mat4(mtx);

    d.z = xTo - xFrom;
    d.y = yTo - yFrom;
    d.x = zTo - zFrom;

    var invLength = abs(d.z) + abs(d.y) + abs(d.x);

    // Scales 'd' if smaller than 10 or larger than 10,000 to be
    // of a magnitude of 10,000.
    if (invLength > 10000.0 || invLength < 10.0) {
        norm.x = d.z;
        norm.y = d.y;
        norm.z = d.x;
        gd_normalize_vec3f(norm);
        norm.x *= 10000.0;
        norm.y *= 10000.0;
        norm.z *= 10000.0;

        d.z = norm.x;
        d.y = norm.y;
        d.x = norm.z;
    }

    invLength = -1.0 / sqrt(power(d.z, 2) + power(d.y, 2) + power(d.x, 2));
    d.z *= invLength;
    d.y *= invLength;
    d.x *= invLength;

    colX.z = yColY * d.x - xColY * d.y;
    colX.y = xColY * d.z - zColY * d.x;
    colX.x = zColY * d.y - yColY * d.z;

    invLength = 1.0 / sqrt(power(colX.z, 2) + power(colX.y, 2) + power(colX.x, 2));

    colX.z *= invLength;
    colX.y *= invLength;
    colX.x *= invLength;

    zColY = d.y * colX.x - d.x * colX.y;
    yColY = d.x * colX.z - d.z * colX.x;
    xColY = d.z * colX.y - d.y * colX.z;

    invLength = 1.0 / sqrt(power(zColY, 2) + power(yColY, 2) + power(xColY, 2))

    zColY *= invLength;
    yColY *= invLength;
    xColY *= invLength;

    mtx[@ M00] = colX.z;
    mtx[@ M10] = colX.y;
    mtx[@ M20] = colX.x;
    mtx[@ M30] = -(xFrom * colX.z + yFrom * colX.y + zFrom * colX.x);

    mtx[@ M01] = zColY;
    mtx[@ M11] = yColY;
    mtx[@ M21] = xColY;
    mtx[@ M31] = -(xFrom * zColY + yFrom * yColY + zFrom * xColY);

    mtx[@ M02] = d.z;
    mtx[@ M12] = d.y;
    mtx[@ M22] = d.x;
    mtx[@ M32] = -(xFrom * d.z + yFrom * d.y + zFrom * d.x);

    mtx[@ M03] = 0.0;
    mtx[@ M13] = 0.0;
    mtx[@ M23] = 0.0;
    mtx[@ M33] = 1.0;
}

function mat4inverse(inv) {
	
	var m = [];
	//log(inv);
	array_copy(m, 0, inv, 0, 16);
	
	inv[@ 0] = m[5]  * m[10] * m[15] - 
             m[5]  * m[11] * m[14] - 
             m[9]  * m[6]  * m[15] + 
             m[9]  * m[7]  * m[14] +
             m[13] * m[6]  * m[11] - 
             m[13] * m[7]  * m[10];

    inv[@ 4] = -m[4]  * m[10] * m[15] + 
              m[4]  * m[11] * m[14] + 
              m[8]  * m[6]  * m[15] - 
              m[8]  * m[7]  * m[14] - 
              m[12] * m[6]  * m[11] + 
              m[12] * m[7]  * m[10];

    inv[@ 8] = m[4]  * m[9] * m[15] - 
             m[4]  * m[11] * m[13] - 
             m[8]  * m[5] * m[15] + 
             m[8]  * m[7] * m[13] + 
             m[12] * m[5] * m[11] - 
             m[12] * m[7] * m[9];

    inv[@ 12] = -m[4]  * m[9] * m[14] + 
               m[4]  * m[10] * m[13] +
               m[8]  * m[5] * m[14] - 
               m[8]  * m[6] * m[13] - 
               m[12] * m[5] * m[10] + 
               m[12] * m[6] * m[9];

    inv[@ 1] = -m[1]  * m[10] * m[15] + 
              m[1]  * m[11] * m[14] + 
              m[9]  * m[2] * m[15] - 
              m[9]  * m[3] * m[14] - 
              m[13] * m[2] * m[11] + 
              m[13] * m[3] * m[10];

    inv[@ 5] = m[0]  * m[10] * m[15] - 
             m[0]  * m[11] * m[14] - 
             m[8]  * m[2] * m[15] + 
             m[8]  * m[3] * m[14] + 
             m[12] * m[2] * m[11] - 
             m[12] * m[3] * m[10];

    inv[@ 9] = -m[0]  * m[9] * m[15] + 
              m[0]  * m[11] * m[13] + 
              m[8]  * m[1] * m[15] - 
              m[8]  * m[3] * m[13] - 
              m[12] * m[1] * m[11] + 
              m[12] * m[3] * m[9];

    inv[@ 13] = m[0]  * m[9] * m[14] - 
              m[0]  * m[10] * m[13] - 
              m[8]  * m[1] * m[14] + 
              m[8]  * m[2] * m[13] + 
              m[12] * m[1] * m[10] - 
              m[12] * m[2] * m[9];

    inv[@ 2] = m[1]  * m[6] * m[15] - 
             m[1]  * m[7] * m[14] - 
             m[5]  * m[2] * m[15] + 
             m[5]  * m[3] * m[14] + 
             m[13] * m[2] * m[7] - 
             m[13] * m[3] * m[6];

    inv[@ 6] = -m[0]  * m[6] * m[15] + 
              m[0]  * m[7] * m[14] + 
              m[4]  * m[2] * m[15] - 
              m[4]  * m[3] * m[14] - 
              m[12] * m[2] * m[7] + 
              m[12] * m[3] * m[6];

    inv[@ 10] = m[0]  * m[5] * m[15] - 
              m[0]  * m[7] * m[13] - 
              m[4]  * m[1] * m[15] + 
              m[4]  * m[3] * m[13] + 
              m[12] * m[1] * m[7] - 
              m[12] * m[3] * m[5];

    inv[@ 14] = -m[0]  * m[5] * m[14] + 
               m[0]  * m[6] * m[13] + 
               m[4]  * m[1] * m[14] - 
               m[4]  * m[2] * m[13] - 
               m[12] * m[1] * m[6] + 
               m[12] * m[2] * m[5];

    inv[@ 3] = -m[1] * m[6] * m[11] + 
              m[1] * m[7] * m[10] + 
              m[5] * m[2] * m[11] - 
              m[5] * m[3] * m[10] - 
              m[9] * m[2] * m[7] + 
              m[9] * m[3] * m[6];

    inv[@ 7] = m[0] * m[6] * m[11] - 
             m[0] * m[7] * m[10] - 
             m[4] * m[2] * m[11] + 
             m[4] * m[3] * m[10] + 
             m[8] * m[2] * m[7] - 
             m[8] * m[3] * m[6];

    inv[@ 11] = -m[0] * m[5] * m[11] + 
               m[0] * m[7] * m[9] + 
               m[4] * m[1] * m[11] - 
               m[4] * m[3] * m[9] - 
               m[8] * m[1] * m[7] + 
               m[8] * m[3] * m[5];

    inv[@ 15] = m[0] * m[5] * m[10] - 
              m[0] * m[6] * m[9] - 
              m[4] * m[1] * m[10] + 
              m[4] * m[2] * m[9] + 
              m[8] * m[1] * m[6] - 
              m[8] * m[2] * m[5];
	
	return inv;
}

function gd_inverse_mat4f(src, dst) {
    gd_copy_mat4f(mat4inverse(src), dst)
}

function gd_normalize_vec3f(vec) {
    var mag = power(vec.x, 2) + power(vec.y, 2) + power(vec.z, 2);
    if (mag == 0.0) return false;

    mag = sqrt(mag);

    if (mag == 0.0) {
        vec.x = 0.0;
        vec.y = 0.0;
        vec.x = 0.0;
        return false;
    }

    vec.x /= mag;
    vec.y /= mag;
    vec.z /= mag;

    return true;
}

function gd_scale_mat4f_by_vec3f(mtx, vec) {
    mtx[M00] *= vec.x;
    mtx[M01] *= vec.x;
    mtx[M02] *= vec.x;
    mtx[M10] *= vec.y;
    mtx[M11] *= vec.y;
    mtx[M12] *= vec.y;
    mtx[M20] *= vec.z;
    mtx[M21] *= vec.z;
    mtx[M22] *= vec.z;
}

function gd_vec3f_magnitude(vec) {
    return sqrt(power(vec.x, 2) + power(vec.y, 2) + power(vec.z, 2))
}

function gd_create_origin_lookat(mtx, _vec, roll) {
    var unit = { vec: _vec };

    gd_normalize_vec3f(unit);
    var hMag = sqrt(power(unit.x, 2) + power(unit.z, 2));

    roll *= RAD_PER_DEG;

    var s = sin(roll);
    var c = cos(roll);

    gd_set_identity_mat4(mtx);

    if (hMag != 0.0) {
        var invertedHMag = 1.0 / hMag;
        mtx[M00] = ((-unit.z * c) - (s * unit.y * unit.x)) * invertedHMag;
        mtx[M10] = ((unit.z * s) - (c * unit.y * unit.x)) * invertedHMag;
        mtx[M20] = -unit.x;
        mtx[M30] = 0.0;

        mtx[M01] = s * hMag;
        mtx[M11] = c * hMag;
        mtx[M21] = -unit.y;
        mtx[M31] = 0.0;

        mtx[M02] = ((c * unit.x) - (s * unit.y * unit.z)) * invertedHMag;
        mtx[M12] = ((-s * unit.x) - (c * unit.y * unit.z)) * invertedHMag;
        mtx[M22] = -unit.z;
        mtx[M32] = 0.0;

        mtx[M03] = 0.0;
        mtx[M13] = 0.0;
        mtx[M23] = 0.0;
        mtx[M33] = 1.0;
    } else {
        mtx[M00] = 0.0;
        mtx[M10] = 1.0;
        mtx[M20] = 0.0;
        mtx[M30] = 0.0;

        mtx[M01] = 0.0;
        mtx[M11] = 0.0;
        mtx[M21] = 1.0;
        mtx[M31] = 0.0;

        mtx[M02] = 1.0;
        mtx[M12] = 0.0;
        mtx[M22] = 0.0;
        mtx[M32] = 0.0;

        mtx[M03] = 0.0;
        mtx[M13] = 0.0;
        mtx[M23] = 0.0;
        mtx[M33] = 1.0;
    }
}

function gd_create_rot_matrix(mtx, vec, s, c) {

    var rev = { z: vec.x, y: vec.y, x: vec.z };

    var oneMinusCos = 1.0 - c;

    mtx[M00] = oneMinusCos * rev.z * rev.z + c;
    mtx[M01] = oneMinusCos * rev.z * rev.y + s * rev.x;
    mtx[M02] = oneMinusCos * rev.z * rev.x - s * rev.y;
    mtx[M03] = 0.0;

    mtx[M10] = oneMinusCos * rev.z * rev.y - s * rev.x;
    mtx[M11] = oneMinusCos * rev.y * rev.y + c;
    mtx[M12] = oneMinusCos * rev.y * rev.x + s * rev.z;
    mtx[M13] = 0.0;

    mtx[M20] = oneMinusCos * rev.z * rev.x + s * rev.y;
    mtx[M21] = oneMinusCos * rev.y * rev.x - s * rev.z;
    mtx[M22] = oneMinusCos * rev.x * rev.x + c;
    mtx[M23] = 0.0;

    mtx[M30] = 0.0;
    mtx[M31] = 0.0;
    mtx[M32] = 0.0;
    mtx[M33] = 1.0;
}

function gd_create_rot_mat_angular(mtx, vec, ang) {

    var s = sin(ang / (DEG_PER_RAD / 2.0));
    var c = cos(ang / (DEG_PER_RAD / 2.0));

    gd_create_rot_matrix(mtx, vec, s, c)

}



function mat4_dot_prod(a, b, res, row, col) {
	
	var xy = ((col * 4) + row);
	
    res[xy] = a[row + (col*0)] * b[(col * 4) + 0] + a[row + (col*1)] * b[(col * 4) + 1] +
              a[row + (col*2)] * b[(col * 4) + 2] + a[row + (col*3)] * b[(col * 4) + 3]
}

function gd_mult_mat4f(mA, mB, dst) {
    var result = array_create(16);

    mat4_dot_prod(mA, mB, result, 0, 0);
    mat4_dot_prod(mA, mB, result, 0, 1);
    mat4_dot_prod(mA, mB, result, 0, 2);
    mat4_dot_prod(mA, mB, result, 0, 3);
    mat4_dot_prod(mA, mB, result, 1, 0);
    mat4_dot_prod(mA, mB, result, 1, 1);
    mat4_dot_prod(mA, mB, result, 1, 2);
    mat4_dot_prod(mA, mB, result, 1, 3);
    mat4_dot_prod(mA, mB, result, 2, 0);
    mat4_dot_prod(mA, mB, result, 2, 1);
    mat4_dot_prod(mA, mB, result, 2, 2);
    mat4_dot_prod(mA, mB, result, 2, 3);
    mat4_dot_prod(mA, mB, result, 3, 0);
    mat4_dot_prod(mA, mB, result, 3, 1);
    mat4_dot_prod(mA, mB, result, 3, 2);
    mat4_dot_prod(mA, mB, result, 3, 3);

    gd_copy_mat4f(result, dst);
}

function gd_mat4f_mult_vec3f(vec, mtx) {
	
    var out = {}

    out.x = mtx[M00] * vec.x + mtx[M10] * vec.y + mtx[M20] * vec.z;
    out.y = mtx[M01] * vec.x + mtx[M11] * vec.y + mtx[M21] * vec.z;
    out.z = mtx[M02] * vec.x + mtx[M12] * vec.y + mtx[M22] * vec.z;

    vec.x = out.x;
    vec.y = out.y;
    vec.z = out.z;
}

function gd_absrot_mat4(mtx, axisnum, ang) {

    var rot = {};
    var rMat = array_create(16);

    switch (axisnum) {
        case GD_X_AXIS:
            rot = { x: 1.0, y: 0.0, z: 0.0 };
            break;
        case GD_Y_AXIS:
            rot = { x: 0.0, y: 1.0, z: 0.0 };
            break;
        case GD_Z_AXIS:
            rot = { x: 0.0, y: 0.0, z: 1.0 };
            break;
    }
    gd_create_rot_mat_angular(rMat, rot, ang / 2.0);
    gd_mult_mat4f(mtx, rMat, mtx);

}

function gd_rot_mat_about_vec(mtx, vec) {
    if (vec.x != 0.0) {
        gd_absrot_mat4(mtx, GD_X_AXIS, vec.x);
    }
    if (vec.y != 0.0) {
        gd_absrot_mat4(mtx, GD_Y_AXIS, vec.y);
    }
    if (vec.z != 0.0) {
        gd_absrot_mat4(mtx, GD_Z_AXIS, vec.z);
    }
}

function gd_add_vec3f_to_mat4f_offset(mtx, vec) {
    mtx[M30] += vec.x;
    mtx[M31] += vec.y;
    mtx[M32] += vec.z;
}

function gd_rotate_and_translate_vec3f(vec, mtx) {

    var out = {}

    out.x =  mtx[M00] * vec.x + mtx[M10] * vec.y + mtx[M20] * vec.z;
    out.y =  mtx[M01] * vec.x + mtx[M11] * vec.y + mtx[M21] * vec.z;
    out.z =  mtx[M02] * vec.x + mtx[M12] * vec.y + mtx[M22] * vec.z;
    out.x += mtx[M30];
    out.y += mtx[M31];
    out.z += mtx[M32];
	
	vec.x = out.x;
	vec.y = out.y;
	vec.z = out.z;

}

function gd_copy_mat4f(src, dst) {

	array_copy(dst, 0, src, 0, 16);
	
}

function gd_set_identity_mat4(mtx) {
	
    array_copy(mtx, 0, matrix_build_identity(), 0, 16);
} 