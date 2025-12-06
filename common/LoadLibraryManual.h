/* LoadLibraryManual.h */

#ifndef LOAD_LIBRARY_MANUAL_H
#define LOAD_LIBRARY_MANUAL_H

DWORD Rva2Offset( DWORD dwRva, UINT_PTR uiBaseAddress  );
DWORD GetReflectiveLoaderOffset( VOID * lpReflectiveDllBuffer  );
HANDLE WINAPI LoadLibraryManual(HANDLE hProcess, LPVOID lpBuffer, DWORD dwLength, LPVOID lpParameter);

// TODO: rename to ManualMapper or something?
//HANDLE LoadLibraryManual(); // fewer's return type
// HMODULE LoadLibraryManual(LPCSTR lpLibFileName); // more correct
//LPVOID LoadLibraryManual(LPCSTR lpLibFileName); // TODO: this is technically the MOST correct return type

#endif
