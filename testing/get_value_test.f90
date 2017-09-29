	program get_value_test
	use bmif
	implicit none

	type (BMI_Model) :: m
	character (len=22), pointer :: names(:)
	integer :: grid_id
	integer :: dims(2)
	character(len=30) :: rowfmt,units
	real*8, pointer :: z(:)

	write (*,"(A)",advance="no") "Initializing..."
	call BMI_Initialize (m, "../../examples/gipl_cfg.cfg")
	write (*,*) "Done."

	call BMI_Get_output_var_names(m, names)
	write (*,"(a, a)") "Output variables: ", names

	call BMI_get_var_grid(m, names(1), grid_id)
	write (*,*) "grid_id of the ",names(1),': ', grid_id

	call BMI_get_grid_shape(m, grid_id, dims)
	write (*,*) "shape of the ",names(1),': ', dims
	write(rowfmt,'(a,i4,a)') '(', dims(2), '(1x,f6.1))'

	write (*, "(a)") "Get values:"
	call BMI_get_value(m, names(1), z)
	write(*,*)z
	
	write (*, "(a)") "Get unit:"
	call BMI_Get_var_units (m, names(1), units)
	write(*,*)units


	end program get_value_test



