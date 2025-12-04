/* GetModuleHandleManual.h */
#ifndef GET_MODULE_HANDLE_MANUAL_H
#define GET_MODULE_HANDLE_MANUAL_H

// GetModuleHandle by literal name
// HMODULE GetModuleHandleManual(LPCWSTR lpModuleName);
// GetModuleHandle by hash
HMODULE GetModuleHandleManual(DWORD moduleHash);

#endif
