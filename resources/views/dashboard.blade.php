<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900 dark:text-gray-100">
                    {{ __("You're logged in!") }}
                </div>
            </div>
            @if(Auth::check() && Auth::user()->role === 'admin')
            <div class="mt-6 bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900 dark:text-gray-100">
                    <div class="flex items-center justify-between mb-4">
                        <h3 class="font-semibold text-lg">Notifikasi Lamaran Baru</h3>
                        <form action="{{ route('notifications.readAll') }}" method="POST">
                            @csrf
                            <button class="inline-flex items-center rounded-md bg-indigo-600 px-3 py-1 text-xs font-semibold text-white hover:bg-indigo-700">Tandai semua dibaca</button>
                        </form>
                    </div>
                    @php($notifications = Auth::user()->notifications)
                    @if($notifications->isEmpty())
                        <p class="text-sm text-gray-500 dark:text-gray-400">Belum ada notifikasi.</p>
                    @else
                        <div class="overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700 text-sm">
                                <thead class="bg-gray-50 dark:bg-gray-700">
                                    <tr>
                                        <th class="px-4 py-2 text-left">Waktu</th>
                                        <th class="px-4 py-2 text-left">Pekerjaan</th>
                                        <th class="px-4 py-2 text-left">Pelamar</th>
                                        <th class="px-4 py-2 text-left">CV</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-gray-200 dark:divide-gray-700">
                                    @foreach($notifications as $n)
                                    @php($data = $n->data)
                                    <tr class="{{ is_null($n->read_at) ? 'bg-yellow-50 dark:bg-yellow-900/20' : '' }}">
                                        <td class="px-4 py-2">{{ $n->created_at->format('Y-m-d H:i') }}</td>
                                        <td class="px-4 py-2">{{ $data['job_title'] ?? '-' }}</td>
                                        <td class="px-4 py-2">{{ $data['applicant_name'] ?? '-' }}</td>
                                        <td class="px-4 py-2">
                                            @if(!empty($data['cv_url']))
                                            <a href="{{ $data['cv_url'] }}" target="_blank" class="text-indigo-600 hover:underline">Download CV</a>
                                            @else
                                            -
                                            @endif
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    @endif
                </div>
            </div>
            @endif
        </div>
    </div>
</x-app-layout>
